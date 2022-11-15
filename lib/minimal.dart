import 'package:drift/drift.dart';

part 'minimal.g.dart';

class Foos extends Table {
  BlobColumn get bar => blob().nullable()();

  @override
  Set<Column> get primaryKey => {bar};
}

@DriftDatabase(tables: [Foos])
class BazDatabase extends _$BazDatabase {
  BazDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
