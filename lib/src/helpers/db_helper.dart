import 'dart:async';

import 'package:briefcase/src/models/transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'briefcasedb.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE trans(id INTEGER PRIMARY KEY, date TEXT, name TEXT, type TEXT, amount INTEGER)",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<TransactionModel> insertTrans(TransactionModel trans) async {
    final Database db = database;

    await db.insert(
      'trans',
      trans.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TransactionModel>> trans() async {
    final Database db = database;

    final List<Map<String, dynamic>> maps = await db.query('trans');

    return List.generate(maps.length, (i) {
      return TransactionModel(
        id: maps[i]['id'],
        dateTransaction: maps[i]['date'],
        titleTransaction: maps[i]['name'],
        typeTransaction: maps[i]['type'],
        amountTransaction: maps[i]['amount'],
      );
    });
  }

  Future<int> countTotal() async {
    final Database db = database;
    final int sumEarning = Sqflite.firstIntValue(await db
        .rawQuery('SELECT SUM(amount) FROM trans WHERE type = "earning"'));
    final int sumExpense = Sqflite.firstIntValue(await db
        .rawQuery('SELECT SUM(amount) FROM trans WHERE type = "expense"'));
    return ((sumEarning == null ? 0 : sumEarning) -
        (sumExpense == null ? 0 : sumExpense));
  }

  Future<void> updateTrans(TransactionModel trans) async {
    final db = database;

    await db.update(
      'trans',
      trans.toMap(),
      where: "id = ?",
      whereArgs: [trans.id],
    );
  }

  Future<void> deleteTrans(int id) async {
    final db = await database;

    await db.delete(
      'trans',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
