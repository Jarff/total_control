import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/widgets/TransactionTitleDateWidget.dart';
import 'package:control_total/src/widgets/TransactionWidget.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

class TransactionsPageWidget extends StatefulWidget {
  const TransactionsPageWidget({Key? key}) : super(key: key);

  @override
  _TransactionsPageWidgetState createState() => _TransactionsPageWidgetState();
}

class _TransactionsPageWidgetState extends State<TransactionsPageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> transactionsWidgets = [];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    Transaction transactionRepo = Transaction();
    var transactions = await transactionRepo.all(orderBy: 'date DESC');
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
      // print(transaction.toMap().toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Buscar',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFFA1B1C9),
                      size: 25,
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1,
                ),
              ),
              const Icon(
                Icons.filter_list_sharp,
                color: Color(0xFFA1B1C9),
                size: 30,
              ),
            ],
          ),
        ),
        ...transactionsWidgets,
      ],
    );
  }
}
