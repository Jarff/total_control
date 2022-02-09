import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class AddRepositoryWidget extends StatefulWidget {
  const AddRepositoryWidget({Key? key}) : super(key: key);

  @override
  _AddRepositoryWidgetState createState() => _AddRepositoryWidgetState();
}

class _AddRepositoryWidgetState extends State<AddRepositoryWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool saving = false;

  Account account = Account(
    name: "Sin asignar",
    balance: 0,
    red: "-",
    type: AccountType.repository,
    cutDate: "-",
  );

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
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
          'Agregar Cuenta',
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
            child: Form(
              key: formKey,
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
                          color: const Color(0xFF1B2024),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 40,
                              color: Color(0x8A171717),
                            )
                          ],
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
                                    account.name,
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
                                    'REPOSITORIO',
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
                      padding: EdgeInsetsDirectional.fromSTEB(25, 15, 25, 10),
                      child: TextFormField(
                        controller: textController1,
                        validator: (input) {
                          if ((input?.trim().length ?? 0) > 0) {
                            return null;
                          } else {
                            return "Este campo es obligatorio";
                          }
                        },
                        onSaved: (input) => account.name = input ?? "",
                        onChanged: (value) {
                          setState(() {
                            account.name = value;
                          });
                        },
                        textCapitalization: TextCapitalization.characters,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(
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
                      child: TextFormField(
                        controller: textController2,
                        validator: (input) {
                          if ((input?.trim().length ?? 0) > 0) {
                            return null;
                          } else {
                            return "Este campo es obligatorio";
                          }
                        },
                        onSaved: (input) =>
                            account.balance = double.parse(input ?? "0"),
                        onChanged: (input) {
                          setState(() {
                            account.balance = double.parse(input);
                          });
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Balance',
                          border: OutlineInputBorder(
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
                          const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 25),
                      child: ElevatedButton(
                        onPressed: () async {
                          //Cambiamos el confirmar por un icono de cargando
                          setState(() {
                            saving = true;
                          });
                          //Hides the keyboard
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState?.validate() ?? false) {
                            account.cardLimit =
                                account.balance + (account.saldo ?? 0);
                            account.create().then((value) async {
                              //Mostramos que se ha creado correctamente
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Cuenta creada correctamente'),
                                ),
                              );
                              await Navigator.of(context)
                                  .pushReplacementNamed('/Pages', arguments: 2);
                            }).catchError((err) {
                              print(err);
                            });
                          } else {
                            setState(() {
                              saving = false;
                            });
                          }
                        },
                        child: (saving)
                            ? const SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFFBCEAC3),
                                  backgroundColor: Colors.black,
                                ),
                              )
                            : Text(
                                "Confirmar",
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF1B2024),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50),
                          ),
                        ),
                      ),
                    ),
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
