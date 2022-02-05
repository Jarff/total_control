import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/widgets/DashboardTransactionCard.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DashboardShortcutTransactionCard extends StatefulWidget {
  String title;
  String route;
  List<Transaction> transactions = [];
  DashboardShortcutTransactionCard({
    Key? key,
    required this.title,
    required this.route,
    required this.transactions,
  }) : super(key: key);

  @override
  _DashboardShortcuTransactiontCardState createState() =>
      _DashboardShortcuTransactiontCardState();
}

class _DashboardShortcuTransactiontCardState
    extends State<DashboardShortcutTransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 275,
        decoration: BoxDecoration(
          color: const Color(0xFFFBF9F5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: Color(0x2A171717),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Text(
                          widget.title,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              print("TODOOOOO!");
                              return const SizedBox(
                                height: 5,
                              );
                            }),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Configurar',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Roboto',
                                color: const Color(0xFF40403E),
                                fontSize: 12,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF40403E),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...addTransactionsCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List addTransactionsCards() {
    if (widget.transactions.isEmpty) {
      return [];
    } else {
      return List.generate(
          widget.transactions.length,
          (index) => DashboardTransactionCard(
              transaction: widget.transactions[index]));
    }
  }
}
