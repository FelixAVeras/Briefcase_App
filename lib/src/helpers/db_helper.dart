import 'package:briefcase/src/models/transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "briefcasedb.db";
  static final _databaseVersion = 1;

  static final table = 'transactions_table';

  static final columnIdTransaction = 'id';
  static final columnTitleTransaction = 'titleTransaction';
  static final columnAmountTransaction = 'amountTransaction';
  static final columnDateTransaction = 'dateTransaction';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnIdTransaction INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitleTransaction TEXT NOT NULL,
            $columnAmountTransaction INTEGER NOT NULL,
            $columnDateTransaction TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(TransactionModel transaction) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'titleTransaction': transaction.titleTransaction,
      'amountTransaction': transaction.amountTransaction,
      'dateTransaction': transaction.dateTransaction,
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Future<List<Map<String, dynamic>>> queryRows(name) async {
  //   Database db = await instance.database;
  //   return await db.query(table, where: "$columnName LIKE '%$name%'");
  // }

  // Future<int> queryRowCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }

  // Future<int> update(Car car) async {
  //   Database db = await instance.database;
  //   int id = car.toMap()['id'];
  //   return await db
  //       .update(table, car.toMap(), where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }
}
