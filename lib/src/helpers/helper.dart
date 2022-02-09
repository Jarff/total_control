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
}
