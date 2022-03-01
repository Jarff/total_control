import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTitleDateWidget extends StatefulWidget {
  Transaction transaction;
  TransactionTitleDateWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<TransactionTitleDateWidget> createState() =>
      _TransactionTitleDateWidgetState();
}

class _TransactionTitleDateWidgetState
    extends State<TransactionTitleDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            DateFormat.yMMMMd('es').format(widget.transaction.date!),
            style: FlutterFlowTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
