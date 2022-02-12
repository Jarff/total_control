import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/widgets/DashboardShortcutTransactionCard.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({Key? key}) : super(key: key);

  @override
  _DashboardPageWidgetState createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double totalBalance = 0;
  double disponible = 0;
  double saldo = 0;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    Account accountRepo =
        Account(balance: 0, name: 'Test', type: AccountType.credit);
    var rows = await accountRepo.all();
    for (var map in rows) {
      Account account = Account.map(map);
      totalBalance += account.cardLimit ?? 0;
      disponible += account.balance;
      saldo += account.saldo ?? 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFFBF9F5),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 50,
                  color: Color(0x2A171717),
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total balance',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                    ),
                  ),
                  Text(
                    '\$${Helper.numberFormat(totalBalance.toStringAsFixed(2))}',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFAEEAB7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Icon(
                        Icons.import_export_outlined,
                        color: Color(0xFFF6F6F6),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 25, 0, 0),
            child: Text(
              'Resumen del mes',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: const AlignmentDirectional(-0.85, -1),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 50,
                              color: Color(0x2A171717),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFE633B), Color(0xFFE25D3A)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Disponible',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: const Color(0xFFFED8CE),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
                              child: Text(
                                '\$${Helper.numberFormat(disponible.toStringAsFixed(2))}',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 15,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFE8964),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: const AlignmentDirectional(-0.85, -1),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 50,
                              color: Color(0x2A171717),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFF172875), Color(0xFF0B1652)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Saldo',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: const Color(0xFFBDC2D7),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
                              child: Text(
                                '\$${Helper.numberFormat(saldo.toStringAsFixed(2))}',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 15,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A62C7),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                DashboardShortcutTransactionCard(
                  title: "Recurrentes",
                  route: "/Recurrentes",
                  transactions: [
                    Transaction(
                        name: "Netflix",
                        date: DateTime(2022, 1, 22),
                        amount: 299)
                  ],
                ),
                DashboardShortcutTransactionCard(
                  title: "Tarjetas",
                  route: "/Recurrentes",
                  transactions: [
                    Transaction(
                        name: "AMEX", date: DateTime(2022, 2, 28), amount: 1299)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
