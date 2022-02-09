import 'package:control_total/src/models/DataModel.dart';
import 'package:control_total/src/models/Model.dart';

class Account extends Model {
  Account(
      {this.id,
      required this.name,
      required this.balance,
      this.saldo,
      required this.type,
      this.red,
      this.cutDate,
      this.cardLimit})
      : super();
  int? id = 1;
  String name;
  double balance;
  double? saldo;
  //Refactorizar esta parte para ser fiel a los principios del SOLID
  String type;
  String? red;
  double? cardLimit;
  String? cutDate;
  @override
  List<DataModel> columns = [];

  @override
  String getTable() {
    table = 'accounts';
    return super.getTable();
  }

  @override
  List<DataModel> setColumns() {
    columns = [
      DataModel(type: "TEXT", name: "name"),
      DataModel(type: "REAL", name: "balance"),
      DataModel(type: "REAL", name: "saldo"),
      DataModel(type: "TEXT", name: "cutDate"),
      DataModel(type: "TEXT", name: "type"),
      DataModel(type: "TEXT", name: "red"),
      DataModel(type: "REAL", name: "cardLimit"),
    ];
    return super.setColumns();
  }

  @override
  dynamic getData() {
    data = this;
    return super.getData();
  }

  Map<String, dynamic> toMap({bool complete = false}) {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'saldo': saldo,
      'cutDate': cutDate,
      'type': type,
      'red': red,
      'cardLimit': cardLimit
    };
  }

  static Account map(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      balance: map['balance'],
      saldo: map['saldo'],
      cutDate: map['cutDate'],
      type: map['type'],
      red: map['red'],
      cardLimit: map['cardLimit'],
    );
  }

  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    balance = map['balance'];
    saldo = map['saldo'];
    cutDate = map['cutDate'];
    type = map['type'];
    red = map['red'];
    cardLimit = map['cardLimit'];
  }
}
