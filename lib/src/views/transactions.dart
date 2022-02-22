import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TransactionsPageWidget extends StatefulWidget {
  const TransactionsPageWidget({Key? key}) : super(key: key);

  @override
  _TransactionsPageWidgetState createState() => _TransactionsPageWidgetState();
}

class _TransactionsPageWidgetState extends State<TransactionsPageWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> ejemplos = [];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    Transaction transactionRepo = Transaction();
    var transactions = await transactionRepo.all();
    DateTime? currentDate = DateTime.now();
    for (var map in transactions) {
      Transaction transaction = await Transaction.map(map);
      if (currentDate != transaction.date) {
        ejemplos.add(Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                transaction.date.toString(),
                style: FlutterFlowTheme.bodyText1,
              ),
            ],
          ),
        ));
      }
      currentDate = transaction.date;
      setState(() {
        ejemplos.add(
          Padding(
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
                        color: const Color(0xFFDB3636),
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
                    Text(
                      '\$${Helper.numberFormat(transaction.amount?.toStringAsFixed(2) ?? "0")}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
        ...ejemplos,
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Dom 11 Ene',
                style: FlutterFlowTheme.bodyText1,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                    'Transacción 2',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF36DB93),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                      child: Text(
                        'CAR',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '\$1,448.09',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                    'Transacción 3',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBD736),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                      child: Text(
                        'SHOPPIN',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '\$1,448.09',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                    'Transacción 4',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6436DB),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                      child: Text(
                        'TRANSPORTATION',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '\$1,448.09',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                    'Transacción 5',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDB3636),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                      child: Text(
                        'SELF CARE',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '\$1,448.09',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
