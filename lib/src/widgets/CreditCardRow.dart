import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class CreditCardRow extends StatefulWidget {
  Account account;
  CreditCardRow({Key? key, required this.account}) : super(key: key);

  @override
  _CreditCardRowState createState() => _CreditCardRowState();
}

class _CreditCardRowState extends State<CreditCardRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              await Navigator.of(context).pushNamed('/DetailAccount');
            },
            child: Container(
              width: 125,
              height: 75,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0x39171717),
                  )
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFB9373),
                    Color(0xFFD26BF1),
                    Color(0xFF21ADE2)
                  ],
                  stops: [0, 0.5, 1],
                  begin: AlignmentDirectional(0.77, 1),
                  end: AlignmentDirectional(-0.77, -1),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              widget.account.name.toUpperCase(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 9,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Text(
                            widget.account.red?.toUpperCase() ?? "-",
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 9,
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          (widget.account.type == AccountType.credit)
                              ? "CREDITO"
                              : "DEBITO",
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          (widget.account.type == AccountType.credit)
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'BALANCE',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFA1B1C9),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${Helper.numberFormat(widget.account.balance.toStringAsFixed(2))}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 0,
                ),
          (widget.account.type == AccountType.credit)
              ? Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'UTILIZADO',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFFA1B1C9),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "${getPorcentage()} %",
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'BALANCE',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFA1B1C9),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$ ${Helper.numberFormat(widget.account.balance.toStringAsFixed(2))}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  String getPorcentage() {
    return (((widget.account.saldo ?? 0) / (widget.account.cardLimit ?? 1)) *
            100)
        .toStringAsFixed(2);
  }
}
