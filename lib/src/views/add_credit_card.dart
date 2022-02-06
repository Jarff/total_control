import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:control_total/themes/widgets/ff_button_widget.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AddCreditCardWidget extends StatefulWidget {
  const AddCreditCardWidget({Key? key}) : super(key: key);

  @override
  _AddCreditCardWidgetState createState() => _AddCreditCardWidgetState();
}

class _AddCreditCardWidgetState extends State<AddCreditCardWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  String _currentSelectedValue = 'VISA';
  String _currentSelectedValueType = 'credit';

  Account account =
      Account(name: "Sin asignar", balance: 0, red: "VISA", type: 'credit');
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //Banco
    textController1 = TextEditingController();
    //Red
    textController2 = TextEditingController();
    //Cuenta (Tipo)
    textController3 = TextEditingController();
    //Balance
    textController4 = TextEditingController();
    //Saldo
    textController5 = TextEditingController();
    //Dia de corte
    textController6 = TextEditingController(text: '10');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFB),
        iconTheme: const IconThemeData(color: Color(0xFFA8AAAB)),
        automaticallyImplyLeading: true,
        title: Text(
          'Agregar Tarjeta',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: const Color(0xFFA8AAAB),
            fontSize: 20,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 25),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  account.name.toUpperCase(),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  account.red?.toUpperCase() ?? "VISA",
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$ ${account.balance}',
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
                                  ((account.type == AccountType.credit))
                                      ? "CREDITO"
                                      : "DEBITO",
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: TextFormField(
                      controller: textController1,
                      onChanged: (value) {
                        setState(() {
                          account.name = value;
                        });
                      },
                      textCapitalization: TextCapitalization.characters,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Banco',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF1B2024),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'Tipo',
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC1C4C4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC1C4C4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFC1C4C4),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15.0))),
                      isEmpty: _currentSelectedValueType == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: _currentSelectedValueType,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentSelectedValueType = newValue ?? "";
                                account.type = newValue!;
                                // state.didChange(newValue);
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                  value: "debit", child: Text("DEBITO")),
                              DropdownMenuItem<String>(
                                  value: "credit", child: Text("CREDITO")),
                            ]),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                  //   child: TextFormField(
                  //     controller: textController2,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         account.red = value;
                  //       });
                  //     },
                  //     textCapitalization: TextCapitalization.characters,
                  //     obscureText: false,
                  //     decoration: InputDecoration(
                  //       labelText: 'Tipo',
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Color(0xFFC1C4C4),
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Color(0xFFC1C4C4),
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //     ),
                  //     style: FlutterFlowTheme.bodyText1.override(
                  //       fontFamily: 'Montserrat',
                  //       color: const Color(0xFF1B2024),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'Cuenta',
                          // labelStyle: textStyle,
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC1C4C4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC1C4C4),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFC1C4C4),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: _currentSelectedValue,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentSelectedValue = newValue ?? "";
                                account.red = newValue;
                                // state.didChange(newValue);
                              });
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                  value: "VISA", child: Text("VISA")),
                              DropdownMenuItem<String>(
                                  value: "MASTERCARD",
                                  child: Text("MASTERCARD")),
                              DropdownMenuItem<String>(
                                  value: "AMEX", child: Text("AMEX")),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: TextFormField(
                      controller: textController4,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Balance',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(
                          Icons.attach_money_outlined,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF1B2024),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: TextFormField(
                      controller: textController5,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Saldo',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(
                          Icons.attach_money_outlined,
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF1B2024),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                    child: TextFormField(
                      controller: textController6,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Día de corte',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFC1C4C4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF1B2024),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 25),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         NavBarPage(initialPage: 'CuentasPage'),
                        //   ),
                        // );
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: const Color(0xFF1B2024),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}