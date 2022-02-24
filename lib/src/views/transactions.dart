import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Transaction.dart';
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
        transactionsWidgets.add(Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DateFormat.yMMMMd('es').format(transaction.date!),
                style: FlutterFlowTheme.bodyText1,
              ),
            ],
          ),
        ));
      }
      currentDate = transaction.date;
      setState(() {
        transactionsWidgets.add(
          Dismissible(
            key: Key(transaction.id.toString()),
            onDismissed: (direction) {
              /*
              TODO:
              We need to delete the record from the DB
              */
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('La transacción se ha eliminado')));
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
                        transaction.name ?? "Sin nombre",
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: transaction.category?.color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                          child: Text(
                            transaction.category?.name?.toUpperCase() ??
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
                            '\$${Helper.numberFormat(transaction.amount?.toStringAsFixed(2) ?? "0")}',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Helper.transactionTypeIcon(transaction.type),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
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
