# Minimal example for BLOB/BYTEA postgres fields with Drift

Issues:

## 1. Table not Automatically Created

This is more tangential and maybe WAI? IIRC, Drift does auto-create missing tables for sqlite3. I just wanted to point it out.

```
Unhandled exception:
PostgreSQLSeverity.error 42P01: relation "foos" does not exist
#0      _PostgreSQLExecutionContextMixin._query (package:postgres/src/connection.dart:513:18)
#1      _PostgreSQLExecutionContextMixin.query (package:postgres/src/connection.dart:474:7)
#2      _PgDelegate.runInsert (package:drift_postgres/src/pg_database.dart:93:26)
<asynchronous suspension>
#3      InsertStatement.insert.<anonymous closure> (package:drift/src/runtime/query_builder/statements/insert.dart:74:18)
<asynchronous suspension>
#4      InsertStatement.insert (package:drift/src/runtime/query_builder/statements/insert.dart:73:12)
<asynchronous suspension>
#5      main (file:///home/sebastian/projects/dart/minimal/bin/minimal.dart:29:3)
<asynchronous suspension>
```

## 2. Batch Inserts

Error:
```
Unhandled exception:
PostgreSQLSeverity.error 42601: syntax error at or near "{"
#0      _PostgreSQLExecutionContextMixin._execute (package:postgres/src/connection.dart:583:18)
#1      _PostgreSQLExecutionContextMixin.execute (package:postgres/src/connection.dart:556:26)
#2      _PgDelegate.runBatched (package:drift_postgres/src/pg_database.dart:61:17)
<asynchronous suspension>
#3      Batch._commit (package:drift/src/runtime/api/batch.dart:184:9)
<asynchronous suspension>
#4      main (file:///home/sebastian/projects/dart/minimal/bin/minimal.dart:31:3)
<asynchronous suspension>
```

## 3. Individual Inserts

Individual inserts seemingly succeed, i.e. no exceptions are thrown no syntax errors on the server. However, reading back the rows the binary data is something else...

Program output:
```
got [123, 49, 44, 50, 44, 51, 44, 52, 125], expected [1, 2, 3, 4] or [9, 8, 7, 6]
got [123, 57, 44, 56, 44, 55, 44, 54, 125], expected [1, 2, 3, 4] or [9, 8, 7, 6]
```
