import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_postgres/postgres.dart';
import 'package:postgres/postgres.dart';

import 'package:minimal/minimal.dart';

void main(List<String> arguments) async {
  final Map<String, String> env = Platform.environment;

  final pgHost = env['DB_HOST'] ?? 'localhost';
  final pgPort = int.parse(env['DB_PORT'] ?? '5432');
  final pgDatabaseName = env['DB_NAME'] ?? 'postgres';
  final pgUsername = env['DB_USER'] ?? 'postgres';
  final pgPassword = env['DB_PASSWORD'] ?? 'postgres';
  print('$pgUsername@$pgHost:$pgPort://$pgDatabaseName');

  final pgConnection = PostgreSQLConnection(pgHost, pgPort, pgDatabaseName,
      username: pgUsername, password: pgPassword, useSSL: false);
  final connection = DatabaseConnection.fromExecutor(PgDatabase(pgConnection));

  final db = BazDatabase(connection.executor);

  final foo1 = Foo(bar: Uint8List.fromList([1, 2, 3, 4]));
  final foo2 = Foo(bar: Uint8List.fromList([9, 8, 7, 6]));

  for (final foo in [foo1, foo2]) {
    await db.into(db.foos).insertOnConflictUpdate(foo);
  }

  //await db.batch((batch) {
  //batch.insertAllOnConflictUpdate(db.foos, [foo1, foo2]);
  //});

  final foos = await db.select(db.foos).get();
  for (final foo in foos) {
    if (![foo1.bar, foo2.bar].contains(foo.bar)) {
      print('got ${foo.bar}, expected ${foo1.bar} or ${foo2.bar}');
    }
  }

  pgConnection.close();
}
