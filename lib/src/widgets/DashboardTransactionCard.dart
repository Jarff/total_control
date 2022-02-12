import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DashboardTransactionCard extends StatefulWidget {
  Transaction transaction;
  DashboardTransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  _DashboardTransactionCardState createState() =>
      _DashboardTransactionCardState();
}

class _DashboardTransactionCardState extends State<DashboardTransactionCard> {
  // NumberFormat
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 50,
              color: Color(0x11171717),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.transaction.name ?? "Sin asignar",
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 5, 0),
                                child: Text(
                                  'Sig.',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFFD5DEED),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.transaction.date?.toString() ??
                                      "Sin asignar",
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFFFE4A52),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$ ${widget.transaction.amount.toString()}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
