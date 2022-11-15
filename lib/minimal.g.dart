// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimal.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Foo extends DataClass implements Insertable<Foo> {
  final Uint8List? bar;
  const Foo({this.bar});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || bar != null) {
      map['bar'] = Variable<Uint8List>(bar);
    }
    return map;
  }

  FoosCompanion toCompanion(bool nullToAbsent) {
    return FoosCompanion(
      bar: bar == null && nullToAbsent ? const Value.absent() : Value(bar),
    );
  }

  factory Foo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Foo(
      bar: serializer.fromJson<Uint8List?>(json['bar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bar': serializer.toJson<Uint8List?>(bar),
    };
  }

  Foo copyWith({Value<Uint8List?> bar = const Value.absent()}) => Foo(
        bar: bar.present ? bar.value : this.bar,
      );
  @override
  String toString() {
    return (StringBuffer('Foo(')
          ..write('bar: $bar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $driftBlobEquality.hash(bar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Foo && $driftBlobEquality.equals(other.bar, this.bar));
}

class FoosCompanion extends UpdateCompanion<Foo> {
  final Value<Uint8List?> bar;
  const FoosCompanion({
    this.bar = const Value.absent(),
  });
  FoosCompanion.insert({
    this.bar = const Value.absent(),
  });
  static Insertable<Foo> custom({
    Expression<Uint8List>? bar,
  }) {
    return RawValuesInsertable({
      if (bar != null) 'bar': bar,
    });
  }

  FoosCompanion copyWith({Value<Uint8List?>? bar}) {
    return FoosCompanion(
      bar: bar ?? this.bar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bar.present) {
      map['bar'] = Variable<Uint8List>(bar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoosCompanion(')
          ..write('bar: $bar')
          ..write(')'))
        .toString();
  }
}

class $FoosTable extends Foos with TableInfo<$FoosTable, Foo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _barMeta = const VerificationMeta('bar');
  @override
  late final GeneratedColumn<Uint8List> bar = GeneratedColumn<Uint8List>(
      'bar', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [bar];
  @override
  String get aliasedName => _alias ?? 'foos';
  @override
  String get actualTableName => 'foos';
  @override
  VerificationContext validateIntegrity(Insertable<Foo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bar')) {
      context.handle(
          _barMeta, bar.isAcceptableOrUnknown(data['bar']!, _barMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {bar};
  @override
  Foo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Foo(
      bar: attachedDatabase.options.types
          .read(DriftSqlType.blob, data['${effectivePrefix}bar']),
    );
  }

  @override
  $FoosTable createAlias(String alias) {
    return $FoosTable(attachedDatabase, alias);
  }
}

abstract class _$BazDatabase extends GeneratedDatabase {
  _$BazDatabase(QueryExecutor e) : super(e);
  late final $FoosTable foos = $FoosTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foos];
}
