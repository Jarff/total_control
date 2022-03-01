import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatefulWidget {
  Transaction transaction;
  TransactionWidget({Key? key, required this.transaction}) : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.transaction.id.toString()),
      onDismissed: (direction) {
        /*
              TODO:
              We need to delete the record from the DB
              */
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('La transacción se ha eliminado')));
      },
      background: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 28.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              // SizedBox(
              //   width: 0,
              // ),
            ],
          )),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFBF9F5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: Color(0x18171717),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.transaction.name ?? "Sin nombre",
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.transaction.category?.color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                    child: Text(
                      widget.transaction.category?.name?.toUpperCase() ??
                          "SIN CATEGORÍA",
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$${Helper.numberFormat(widget.transaction.amount?.toStringAsFixed(2) ?? "0")}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Helper.transactionTypeIcon(widget.transaction.type),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
