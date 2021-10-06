import 'dart:async';

import 'package:briefcase/src/models/productos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnProd {
  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'producto.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE prod(id INTEGER PRIMARY KEY, nombre TEXT, precioUnitario INTEGER, costoUnitario INTEGER, categoria TEXT, descripcion INTEGER)",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<ProductoModel> insertProducto(ProductoModel prod) async {
    final Database db = await database;

    await db.insert(
      'prod',
      prod.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductoModel>> prod() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('prod');

    return List.generate(maps.length, (i) {
      return ProductoModel(id: maps[i]['id'], nombre: maps[i]['nombre'], precioUnitario: maps[i]['precioUnitario'], costoUnitario: maps[i]['costoUnitario'], categoria: maps[i]['categoria'], descripcion: maps[i]['descripcion']);
    });
  }

  Future<void> updateProducto(ProductoModel prod) async {
    final db = await database;

    await db.update(
      'prod',
      prod.toMap(),
      where: "id = ?",
      whereArgs: [prod.id],
    );
  }

  Future<void> deleteProducto(int id) async {
    final db = await database;

    await db.delete(
      'prod',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}