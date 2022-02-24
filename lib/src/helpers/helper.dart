import 'package:control_total/src/models/TransactionType.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  BuildContext? context;

  Helper.of(BuildContext _context) {
    context = _context;
  }

  static String numberFormat(String number) {
    var numberFormat = NumberFormat('#,###.0#', 'es_MX');
    return numberFormat.format(double.parse(number));
  }

  static Widget transactionTypeIcon(String? type) {
    switch (type) {
      case TransactionType.deposit:
        return const Icon(Icons.arrow_upward,
            color: Color(0xFF2DCE89), size: 20);
      case TransactionType.expense:
        return const Icon(Icons.arrow_downward,
            color: Color(0xFFF5365C), size: 20);
      case TransactionType.withdraw:
        return const Icon(Icons.arrow_back, color: Color(0xFF5E72E4));
      case TransactionType.transfer:
        return const Icon(Icons.compare_arrows, color: Color(0xFFFB6340));
      default:
        return const SizedBox(
          height: 0,
        );
    }
  }
}
