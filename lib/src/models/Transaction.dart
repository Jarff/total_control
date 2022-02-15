import 'dart:convert';

import 'package:control_total/src/helpers/DataModelType.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/DataModel.dart';
import 'package:control_total/src/models/Model.dart';
import 'package:control_total/src/models/category.dart';

class Transaction extends Model {
  Transaction({
    this.id,
    this.name,
    this.date,
    this.amount,
    this.category,
    this.account,
  }) : super();

  int? id = 1;
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
      DataModel(type: DataModelType.text, name: "category"),
      DataModel(type: DataModelType.text, name: "account"),
    ];
    return super.setColumns();
  }

  @override
  dynamic getData() {
    data = this;
    return super.getData();
  }

  static Transaction map(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      category:
          Category.map(map['category']), //Creo que hay que convertirlo a map
      account: Account.map(map['account']), //Creo que hay que convertirlo a map
    );
  }

  Map<String, dynamic> toMap({bool complete = false}) {
    return {
      'id': id,
      'name': name,
      'date': date.toString(),
      'amount': amount,
      'category': category?.toMap(),
      'account': account?.toMap(),
    };
  }

  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    date = DateTime.parse(map['date']);
    amount = map['amount'];
    category = Category.map(map['category']);
    account = Account.map(map['account']);
  }
}
