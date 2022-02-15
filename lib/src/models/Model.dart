import 'dart:convert';

import 'package:control_total/src/models/DataModel.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class Model {
  String? table;
  List<DataModel> columns = [];
  late Future<Database> database;
  dynamic data;
  String condition = '';
  List arguments = [];

  Model({table}) {
    table = getTable();
    columns = setColumns();
    data = getData();
    // startConnection();
  }

  String getTable() {
    return table ?? "";
  }

  List<DataModel> setColumns() {
    return columns;
  }

  Future<Database> startConnection() async {
    String text = '';
    columns.forEach((column) {
      text += ", ${column.name} ${column.type}";
    });
    // print(text);
    return openDatabase(
      join(await getDatabasesPath(), '${table}.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $table(id INTEGER PRIMARY KEY$text)',
        );
      },
      version: 1,
    );
  }

  dynamic getData() {
    return data;
  }

  Future<int> create() async {
    final database = startConnection();
    final db = await database;

    if (table != null) {
      Map<String, dynamic> map = {};
      data.toMap().keys.forEach((key) {
        if (key != "id") {
          if (data.toMap()[key] is Map) {
            //Lo volvemos json
            map[key] = jsonEncode(data.toMap()[key]);
            print(map[key]);
            // map[key] = data.toMap()[key].toString();
          } else {
            map[key] = data.toMap()[key];
          }
        }
      });
      return 0;
      // return await db.insert(table!, data.toMap(),
      //     conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      return 0;
    }
  }

  Future<void> update() async {
    final database = startConnection();
    final db = await database;
    await db.update(
      table!,
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  Future<Map<String, dynamic>> first() async {
    final database = startConnection();
    final db = await database;
    //Verificamos que si este definido la tabla
    if (table == null) {
      print('tabla no definida');
    }
    final List<Map<String, dynamic>> maps = await db.query(table!, limit: 1);
    if (maps.isNotEmpty) {
      return maps[0];
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> find(int id) async {
    final database = startConnection();
    final db = await database;
    //Verificamos que si este definido la tabla
    if (table == null) {
      print('tabla no definida');
    }
    final List<Map<String, dynamic>> maps =
        await db.query(table!, where: "id=?", whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return maps[0];
    } else {
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> all() async {
    final database = startConnection();
    final db = await database;
    //Verificamos que si este definido la tabla
    if (table == null) {
      print("tabla no definida");
    }
    final List<Map<String, dynamic>> maps = await db.query(table!);
    return List.generate(maps.length, (index) {
      data.fromMap(maps[index]);
      return data.toMap(complete: true);
    });
  }

  Future<List<Map<String, dynamic>>> where(String condition, List arguments,
      {orderBy}) async {
    final database = startConnection();
    final db = await database;
    //Verificamos que si este definido la tabla
    if (table == null) {
      print('tabla no definida');
    }
    final List<Map<String, dynamic>> maps = await db.query(table!,
        where: condition, whereArgs: arguments, orderBy: orderBy);
    return List.generate(maps.length, (index) {
      data.fromMap(maps[index]);
      return data.toMap(complete: true);
    });
  }

  Future<List<Map<String, dynamic>>> get() async {
    final database = startConnection();
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(table!, where: condition, whereArgs: arguments);
    return List.generate(maps.length, (index) {
      data.fromMap(maps[index]);
      return data.toMap(complete: true);
    });
  }

  Future<void> delete() async {
    final database = startConnection();
    final db = await database;

    await db.delete(
      table!,
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  Future<Map<String, dynamic>> createOrUpdate() async {
    //Verificamos si existe el archivo
    Map<String, dynamic> map = await find(data.id);
    if (map.length > 0) {
      //Actualizamos
      update();
      return await find(data.id);
    } else {
      //Creamos
      create();
      return await find(data.id);
    }
  }
}
