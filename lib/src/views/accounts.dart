import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/account_red.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/widgets/CreditCardRow.dart';
import 'package:control_total/src/widgets/LoadingAccounts.dart';
import 'package:control_total/src/widgets/RepositoryCardRow.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:control_total/themes/widgets/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AccountsPageWidget extends StatefulWidget {
  const AccountsPageWidget({Key? key}) : super(key: key);

  @override
  _AccountsPageWidgetState createState() => _AccountsPageWidgetState();
}

class _AccountsPageWidgetState extends State<AccountsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;
  List<CreditCardRow> creditCards = [
    CreditCardRow(
      account: Account(
          name: "Santander",
          balance: 1448.09,
          type: AccountType.credit,
          limit: 7000,
          red: AccountRed.mastercard),
    ),
    CreditCardRow(
      account: Account(
          name: "AMEX",
          balance: 843.59,
          type: AccountType.credit,
          limit: 9000,
          red: AccountRed.visa),
    )
  ];
  List<CreditCardRow> debitCards = [
    CreditCardRow(
      account: Account(
        name: "Santander",
        balance: 1448.09,
        type: AccountType.debit,
        red: AccountRed.visa,
      ),
    ),
  ];
  List<RepositoryCardRow> repositoryCard = [
    RepositoryCardRow(
      account: Account(
        name: "Efectivo",
        balance: 345,
        type: AccountType.repository,
      ),
    ),
    RepositoryCardRow(
      account: Account(
        name: "Ahorro",
        balance: 1989,
        type: AccountType.repository,
      ),
    ),
  ];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        (loading)
            ? const LoadingAccounts()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
                          begin: AlignmentDirectional(1, 0.98),
                          end: AlignmentDirectional(-1, -0.98),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$4,162.04',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Valor neto',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tarjetas de Crédito',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFFA1B1C9),
                            size: 30,
                          ),
                          onPressed: () async {
                            await Navigator.of(context)
                                .pushNamed('/AddCreditCard');
                          },
                        ),
                      ],
                    ),
                  ),
                  ...creditCards,
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Repositorio',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFFA1B1C9),
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                  ...repositoryCard,
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tarjetas de Débito',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFFA1B1C9),
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                  ...debitCards
                ],
              )
      ],
    );
  }
}
