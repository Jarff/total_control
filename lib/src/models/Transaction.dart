import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/category.dart';

class Transaction {
  String? id = "1";
  String? name = "Sin nombre";
  DateTime? date = DateTime.now();
  double? amount = 0.0;
  Category? category;
  Account? account;

  Transaction({
    this.id,
    this.name,
    this.date,
    this.amount,
    this.category,
    this.account,
  }) : super();

  Map<String, dynamic> toMap({bool complete = false}) {
    return {
      'id': id,
      'name': name,
      'date': date,
      'amount': amount,
      'category': category?.toMap(),
      'account': account?.toMap(),
    };
  }
}
