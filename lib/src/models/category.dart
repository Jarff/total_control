import 'package:control_total/src/models/DataModel.dart';
import 'package:control_total/src/models/Model.dart';
import 'package:flutter/material.dart';

class Category extends Model {
  int? id;
  String? name;
  Color? color;
  Category({this.id, this.name, this.color});

  @override
  List<DataModel> columns = [];

  @override
  String getTable() {
    table = 'categories';
    return super.getTable();
  }

  @override
  List<DataModel> setColumns() {
    columns = [
      DataModel(type: "TEXT", name: "name"),
      DataModel(type: "TEXT", name: "color"),
    ];
    return super.setColumns();
  }

  @override
  dynamic getData() {
    data = this;
    return super.getData();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color?.value.toString(),
    };
  }

  static Category map(Map<String, dynamic> map) {
    return Category(id: map['id'], name: map['name'], color: map['color']);
  }
}
