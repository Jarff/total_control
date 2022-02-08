import 'package:control_total/src/models/DataModel.dart';
import 'package:control_total/src/models/Model.dart';

class Account extends Model {
  Account(
      {required this.name,
      required this.balance,
      this.saldo,
      required this.type,
      this.red,
      this.cutDate,
      this.limit})
      : super();
  int? id = 1;
  String name;
  double balance;
  double? saldo;
  String type;
  String? red;
  double? limit;
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
      DataModel(type: "TEXT", name: "balance"),
      DataModel(type: "TEXT", name: "saldo"),
      DataModel(type: "TEXT", name: "cutDate"),
      DataModel(type: "TEXT", name: "type"),
      DataModel(type: "TEXT", name: "limit"),
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
      'balance': balance,
      'saldo': saldo,
      'cutDate': cutDate,
      'type': type,
      'limit': limit
    };
  }
}
