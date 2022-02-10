import 'package:control_total/src/models/TransactionType.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BannerTransaction extends StatelessWidget {
  String type;
  Color? color;
  String? title;
  BannerTransaction({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == TransactionType.deposit) {
      title = "Depósito";
      color = const Color(0xFF2DCE89);
    } else if (type == TransactionType.expense) {
      title = "Gasto";
      color = const Color(0xFFF5365C);
    } else if (type == TransactionType.transfer) {
      title = "Transferencia";
      color = const Color(0xFFFB6340);
    } else if (type == TransactionType.withdraw) {
      title = "Retiro";
      color = const Color(0xFF5E72E4);
    }
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 25),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Color(0x8A171717),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? "?",
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
