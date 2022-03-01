import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/models/TransactionType.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/widgets/TransactionTitleDateWidget.dart';
import 'package:control_total/src/widgets/TransactionWidget.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class AccountDetailWidget extends StatefulWidget {
  var account;
  AccountDetailWidget({Key? key, required this.account}) : super(key: key);

  @override
  State<AccountDetailWidget> createState() => AccountDetailWidgetState();
}

class AccountDetailWidgetState extends State<AccountDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> transactionsWidgets = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    Transaction transactionRepo = Transaction();
    var transactions = await transactionRepo
        .where('account_id=?', [widget.account.id], orderBy: "date DESC");
    DateTime? currentDate = DateTime.now();
    for (var map in transactions) {
      Transaction transaction = await Transaction.map(map);
      if (currentDate != transaction.date) {
        transactionsWidgets
            .add(TransactionTitleDateWidget(transaction: transaction));
      }
      currentDate = transaction.date;
      setState(() {
        transactionsWidgets.add(TransactionWidget(transaction: transaction));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: (widget.account.type == AccountType.credit)
          ? SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                backgroundColor: Color(0xFF2DCE89),
                onPressed: () async {
                  // Add your onPressed code here!
                  await Navigator.of(context).pushReplacementNamed(
                      '/AddTransaction',
                      arguments: TransactionType.transfer);
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("PAGAR"),
                ),
              ),
            )
          : null,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFB),
        iconTheme: const IconThemeData(color: Color(0xFFA8AAAB)),
        automaticallyImplyLeading: true,
        title: Text(
          'Detalle Cuenta',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: const Color(0xFFA8AAAB),
            fontSize: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: Icon(
              Icons.edit_rounded,
              color: Color(0xFFA8AAAB),
              size: 24,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFB),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 25),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 40,
                              color: Color(0x8A171717),
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
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 15, 15, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.account.name,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.account.red,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$ ${Helper.numberFormat(widget.account?.balance.toStringAsFixed(2) ?? 0)}',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    widget.account.getType(),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 14,
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
                        ? Text(
                            'Saldo: \$${Helper.numberFormat(widget.account.saldo.toStringAsFixed(2) ?? '0.0')}',
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    /**
                     * TODO:
                     * Agregar el texto que indica la fecha líimite de pago
                     * Mejorar la estetica de la vista
                     */
                    (widget.account.type == AccountType.credit)
                        ? Text(
                            'Día de corte: ${widget.account.cutDate ?? '-'}',
                            style: FlutterFlowTheme.subtitle2,
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    ...transactionsWidgets
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
