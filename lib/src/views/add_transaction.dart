import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/models/TransactionType.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/models/category.dart';
import 'package:control_total/src/widgets/BannerTransaction.dart';
import 'package:control_total/src/widgets/LoadingAccounts.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AddTransactionWidget extends StatefulWidget {
  String type;
  AddTransactionWidget({Key? key, required this.type}) : super(key: key);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  DateTime selectedDated = DateTime.now();
  Transaction transaction = Transaction();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool saving = false;
  String? _currentSelectedValueType;
  String? _currentSelectedValueTypeCategory = "1";
  List<Account> accounts = [];
  List<Category> categories = [
    Category(id: 1, name: "Salud"),
    Category(id: 2, name: "Belleza"),
    Category(id: 3, name: "Super"),
    Category(id: 4, name: "Comida"),
    Category(id: 5, name: "Transporte"),
    Category(id: 6, name: "Vida Social"),
  ];
  List<DropdownMenuItem<String>> categoryOptions = [
    const DropdownMenuItem<String>(
      value: "0",
      child: Text("Salud", overflow: TextOverflow.ellipsis),
    ),
    const DropdownMenuItem<String>(
      value: "1",
      child: Text("Belleza", overflow: TextOverflow.ellipsis),
    ),
    const DropdownMenuItem<String>(
      value: "2",
      child: Text("Super", overflow: TextOverflow.ellipsis),
    ),
    const DropdownMenuItem<String>(
      value: "3",
      child: Text("Comida", overflow: TextOverflow.ellipsis),
    ),
    const DropdownMenuItem<String>(
      value: "4",
      child: Text("Transporte", overflow: TextOverflow.ellipsis),
    ),
    const DropdownMenuItem<String>(
      value: "5",
      child: Text("Vida Social", overflow: TextOverflow.ellipsis),
    ),
  ];

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    // options = [];
  }

  Future<List<DropdownMenuItem<String>>> loadAccounts() async {
    Account accountRepo =
        Account(balance: 0, name: 'Test', type: AccountType.credit);
    var accounts = await accountRepo.all();
    List<DropdownMenuItem<String>> options = [];
    _currentSelectedValueType ??= accounts[0]['id'].toString();
    for (var map in accounts) {
      Account account = Account.map(map);
      this.accounts.add(account);
      options.add(
        DropdownMenuItem<String>(
          value: account.id.toString(),
          child: Text(
              "${account.name} ${account.red} ${AccountType.string(account.type)}",
              overflow: TextOverflow.ellipsis),
        ),
      );
    }
    return options;
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
          'Agregar Transacción',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: const Color(0xFFA8AAAB),
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFB),
              ),
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: loadAccounts(),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return LoadingAccounts();
                      } else {
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BannerTransaction(type: widget.type),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 10),
                                child: TextFormField(
                                  controller: textController1,
                                  validator: (input) {
                                    if ((input?.trim().length ?? 0) > 0) {
                                      return null;
                                    } else {
                                      return "Este campo es obligatorio";
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      transaction.name = value;
                                    });
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Descripción',
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
                              /**
                           * TODO:
                           * Debo cambiarlo por el input que puede buscar
                           */
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 10),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: 'Categoría',
                                      errorStyle: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16.0),
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
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  isEmpty:
                                      _currentSelectedValueTypeCategory == '',
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _currentSelectedValueTypeCategory,
                                      isDense: true,
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _currentSelectedValueTypeCategory =
                                              newValue ??
                                                  _currentSelectedValueTypeCategory;
                                          transaction.category = categories[
                                              int.parse(
                                                  _currentSelectedValueTypeCategory ??
                                                      "0")];
                                        });
                                        // print(_currentSelectedValueType);
                                      },
                                      items: categoryOptions,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 10),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: 'Cuenta',
                                      errorStyle: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16.0),
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
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  isEmpty: _currentSelectedValueType == '',
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _currentSelectedValueType,
                                      isDense: true,
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _currentSelectedValueType =
                                              newValue ??
                                                  _currentSelectedValueType;
                                          var selectedAccount =
                                              accounts.firstWhere(
                                            (account) =>
                                                account.id.toString() ==
                                                _currentSelectedValueType,
                                          );
                                          transaction.account = selectedAccount;
                                        });
                                        // print(_currentSelectedValueType);
                                      },
                                      items: [...snapshot.data],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 10),
                                child: TextFormField(
                                  controller: textController4,
                                  obscureText: false,
                                  onChanged: (value) {
                                    setState(() {
                                      transaction.amount = double.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Cantidad',
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 10),
                                child: TextFormField(
                                  controller: textController5,
                                  obscureText: false,
                                  readOnly: true,
                                  onTap: () async {
                                    selectedDated = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 1),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                    ))!;
                                    textController5?.value = TextEditingValue(
                                        text: selectedDated.toString());
                                    transaction.date = selectedDated;
                                  },
                                  validator: (input) {
                                    if ((input?.trim().length ?? 0) > 0) {
                                      return null;
                                    } else {
                                      return "Este campo es obligatorio";
                                    }
                                  },
                                  // initialValue: selectedDated.toString(),
                                  decoration: InputDecoration(
                                    labelText: 'Fecha',
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 25),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    //Cambiamos el confirmar por un icono de cargando
                                    setState(() {
                                      saving = true;
                                    });
                                    // Hides the keyboard
                                    FocusScope.of(context).unfocus();
                                    formKey.currentState?.validate();
                                    print(transaction.toMap().toString());
                                    // if (formKey.currentState?.validate() ?? false) {
                                    //   account.cardLimit =
                                    //       account.balance + (account.saldo ?? 0);
                                    //   account.create().then((value) async {
                                    //     //Mostramos que se ha creado correctamente
                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                    //       const SnackBar(
                                    //         content: Text('Cuenta creada correctamente'),
                                    //       ),
                                    //     );
                                    //     await Navigator.of(context)
                                    //         .pushReplacementNamed('/Pages', arguments: 2);
                                    //   }).catchError((err) {
                                    //     print(err);
                                    //   });
                                    // } else {
                                    //   setState(() {
                                    //     saving = false;
                                    //   });
                                    // }
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
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0xFF1B2024),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(double.infinity, 50),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}