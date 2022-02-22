import 'dart:convert';

import 'package:control_total/src/helpers/DataModelType.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/DataModel.dart';
import 'package:control_total/src/models/Model.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/models/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction extends Model {
  Transaction(
      {this.id,
      this.name,
      this.date,
      this.amount,
      this.category,
      this.account,
      this.categoryId,
      this.accountId})
      : super();

  int? id = 1;
  int? categoryId;
  int? accountId;
  String? name = "Sin nombre";
  DateTime? date = DateTime.now();
  double? amount = 0.0;
  Category? category;
  Account? account;
  @override
  List<DataModel> columns = [];

  @override
  String getTable() {
    table = 'transactions';
    return super.getTable();
  }

  @override
  List<DataModel> setColumns() {
    columns = [
      DataModel(type: DataModelType.text, name: "name"),
      DataModel(type: DataModelType.text, name: "date"),
      DataModel(type: DataModelType.real, name: "amount"),
      DataModel(type: DataModelType.integer, name: "category_id"),
      DataModel(type: DataModelType.text, name: "category"),
      DataModel(type: DataModelType.integer, name: "account_id"),
      DataModel(type: DataModelType.text, name: "account"),
    ];
    return super.setColumns();
  }

  @override
  dynamic getData() {
    data = this;
    return super.getData();
  }

  static Future<Transaction> map(Map<String, dynamic> map) async {
    Category _category = Category();
    if (map['category_id'] != null) {
      var categoryMap = await _category.find(map['category_id']);
      _category = Category.map(categoryMap);
    }
    Account _account = Account(
      id: 0,
      name: "Sin cuenta",
      balance: 0,
      type: AccountType.repository,
    );
    if (map['account_id'] != null) {
      var accountMap = await _account.find(map['account_id']);
      _account = Account.map(accountMap);
    }
    return Transaction(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      categoryId: map['category_id'],
      category: (map['category'] != null)
          ? Category.map(map['category'])
          : _category, //Creo que hay que convertirlo a map
      account: (map['account'] != null)
          ? Account.map(map['account'])
          : _account, //Creo que hay que convertirlo a map
      accountId: map['account_id'],
    );
  }

  Map<String, dynamic> toMap({bool complete = false}) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return {
      'id': id,
      'category_id': categoryId,
      'account_id': accountId,
      'name': name,
      'date': formatter.format(date ?? DateTime.now()),
      'amount': amount,
      'category': category?.toMap(),
      'account': account?.toMap(),
    };
  }

  void fromMap(Map<String, dynamic> map) async {
    id = map['id'];
    categoryId = map['category_id'];
    accountId = map['account_id'];
    name = map['name'];
    date = DateTime.parse(map['date']);
    amount = map['amount'];
    if (map['category'] is Map) {
      category = Category.map(map['category']);
    } else {
      //Buscamos el registro
      Category _category = Category();
      if (map['category_id'] != null) {
        var data = await _category.find(map['category_id']);
        category = Category.map(data);
      } else {
        category = Category();
      }
    }
    if (map['account'] is Map) {
      account = Account.map(map['account']);
    } else {
      Account _account = Account(name: '/', balance: 0, type: '/');
      if (map['account_id'] != null) {
        var data = await _account.find(map['account_id']);
        account = Account.map(data);
      } else {
        account = _account;
      }
    }
  }
}
