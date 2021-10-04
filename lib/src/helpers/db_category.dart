import 'dart:async';

import 'package:briefcase/src/models/categoria.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConn {
  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'categoria.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE cats(id INTEGER PRIMARY KEY, name TEXT)",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<CategoryModel> insertCategory(CategoryModel cats) async {
    final Database db = await database;

    await db.insert(
      'cats',
      cats.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CategoryModel>> cats() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('cats');

    return List.generate(maps.length, (i) {
      return CategoryModel(id: maps[i]['id'], name: maps[i]['name']);
    });
  }

  Future<void> updateCategory(CategoryModel cats) async {
    final db = await database;

    await db.update(
      'cats',
      cats.toMap(),
      where: "id = ?",
      whereArgs: [cats.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;

    await db.delete(
      'cats',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
