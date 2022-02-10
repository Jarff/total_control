import 'package:control_total/src/models/RouteArgument.dart';
import 'package:control_total/src/models/TransactionType.dart';
import 'package:control_total/src/views/accounts.dart';
import 'package:control_total/src/views/dashboard.dart';
import 'package:control_total/src/views/suscription.dart';
import 'package:control_total/src/views/transactions.dart';
import 'package:control_total/src/widgets/TransactionTypeButton.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:control_total/themes/widgets/flutter_flow_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PagesWidget extends StatefulWidget {
  dynamic currentTab;
  RouteArgument routeArgument = RouteArgument();
  Widget currentPage = const DashboardPageWidget();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PagesWidget({
    Key? key,
    this.currentTab,
  }) : super(key: key) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
  }

  @override
  _PagesWidgetState createState() {
    return _PagesWidgetState();
  }
}

class _PagesWidgetState extends State<PagesWidget> {
  bool showFloating = false;
  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(PagesWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = const DashboardPageWidget();
          showFloating = false;
          break;
        case 1:
          widget.currentPage = const SuscriptionPageWidget();
          showFloating = false;
          break;
        case 2:
          widget.currentPage = const AccountsPageWidget();
          showFloating = false;
          break;
        case 3:
          widget.currentPage = const TransactionsPageWidget();
          showFloating = true;
          break;
        default:
          widget.currentPage = const DashboardPageWidget();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: const Color(0xFFF2F3F5),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: (showFloating)
            ? FloatingActionButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(Icons.add_circle,
                    color: Color(0xFFA1B1C9), size: 30),
                backgroundColor: Colors.white,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Nueva Transacción'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TransactionTypeButton(
                                  title: 'Depósito',
                                  type: TransactionType.deposit,
                                  icon: const Icon(Icons.arrow_upward,
                                      color: Color(0xFF2DCE89), size: 20),
                                ),
                                TransactionTypeButton(
                                  title: 'Gasto',
                                  type: TransactionType.expense,
                                  icon: const Icon(Icons.arrow_downward,
                                      color: Color(0xFFF5365C), size: 20),
                                ),
                                TransactionTypeButton(
                                  title: 'Retiro',
                                  type: TransactionType.withdraw,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF5E72E4),
                                  ),
                                ),
                                TransactionTypeButton(
                                  title: 'Transferencia',
                                  type: TransactionType.transfer,
                                  icon: const Icon(Icons.compare_arrows,
                                      color: Color(0xFFFB6340)),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cerrar')),
                          ],
                        );
                      });
                },
              )
            : null,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F3F5),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 10, 0),
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/424/600',
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hola!',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFFA3B2C7),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Rodrigo S.',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 5,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: Colors.white,
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xFFA1B1C9),
                            size: 20,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: widget.currentPage,
                  )
                  // SingleChildScrollView(child: widget.currentPage),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).secondaryHeaderColor,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIconTheme:
              const IconThemeData(color: Color(0x8A000000), size: 28),
          unselectedItemColor: const Color(0XFFBDC2D7),
          currentIndex: widget.currentTab,
          onTap: (int i) {
            _selectTab(i);
          },
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              label: "Dashboard",
              icon: Column(children: [
                const Icon(Icons.dashboard),
                Text(
                  "Dashboard",
                  style: TextStyle(
                      color: (widget.currentTab == 0)
                          ? const Color(0x8A000000)
                          : const Color(0XFFBDC2D7)),
                )
              ]),
            ),
            BottomNavigationBarItem(
              label: "Recurrentes",
              icon: Column(children: [
                const Icon(Icons.loop),
                Text(
                  "Recurrentes",
                  style: TextStyle(
                      color: (widget.currentTab == 1)
                          ? const Color(0x8A000000)
                          : const Color(0XFFBDC2D7)),
                )
              ]),
            ),
            BottomNavigationBarItem(
              label: "Cuentas",
              icon: Column(children: [
                const Icon(Icons.account_balance_outlined),
                Text(
                  "Cuentas",
                  style: TextStyle(
                      color: (widget.currentTab == 2)
                          ? const Color(0x8A000000)
                          : const Color(0XFFBDC2D7)),
                )
              ]),
            ),
            BottomNavigationBarItem(
              label: "Movimientos",
              icon: Column(children: [
                const Icon(Icons.post_add_rounded),
                Text(
                  "Movimientos",
                  style: TextStyle(
                      color: (widget.currentTab == 3)
                          ? const Color(0x8A000000)
                          : const Color(0XFFBDC2D7)),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
