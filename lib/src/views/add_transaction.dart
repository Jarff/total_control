import 'package:control_total/src/models/Account.dart';
import 'package:control_total/src/models/Transaction.dart';
import 'package:control_total/src/models/TransactionType.dart';
import 'package:control_total/src/models/account_type.dart';
import 'package:control_total/src/models/category.dart';
import 'package:control_total/src/widgets/BannerTransaction.dart';
import 'package:control_total/src/widgets/LoadingAccounts.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  String? _currentSelectedValueTypeDestination;
  String? _currentSelectedValueTypeCategory;
  List<Account> accounts = [];
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    transaction.type = widget.type;
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    // options = [];
  }

  Future<Map<String, List<DropdownMenuItem<String>>>> loadResources() async {
    Account accountRepo =
        Account(balance: 0, name: 'Test', type: AccountType.credit);
    var accounts = await accountRepo.all();
    Map<String, List<DropdownMenuItem<String>>> data = {
      'account_options': <DropdownMenuItem<String>>[],
      'category_options': <DropdownMenuItem<String>>[]
    };
    // List<DropdownMenuItem<String>> options = [];
    if (accounts.isNotEmpty) {
      _currentSelectedValueType ??= accounts[0]['id'].toString();
      _currentSelectedValueTypeDestination ??= accounts[0]['id'].toString();
      transaction.account ??= Account.map(accounts[0]);
      transaction.accountId ??= (Account.map(accounts[0])).id;

      for (var map in accounts) {
        Account account = Account.map(map);
        this.accounts.add(account);
        data['account_options']?.add(
          DropdownMenuItem<String>(
            value: account.id.toString(),
            child: Text(
                "${account.name} ${account.red} ${AccountType.string(account.type)}",
                overflow: TextOverflow.ellipsis),
          ),
        );
      }
      //Ahora creamos las opciones para las categorías
      Category categoryRepo = Category();
      var categories = await categoryRepo.all();
      _currentSelectedValueTypeCategory ??= categories[0]['id'].toString();
      transaction.category ??= Category.map(categories[0]);
      transaction.categoryId ??= (Category.map(categories[0])).id;

      for (var map in categories) {
        Category category = Category.map(map);
        this.categories.add(category);
        data['category_options']?.add(DropdownMenuItem<String>(
          value: category.id.toString(),
          child: Text(category.name ?? "Categoría sin nombre",
              overflow: TextOverflow.ellipsis),
        ));
      }
    }
    return data;
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
                    future: loadResources(),
                    initialData: const {
                      'account_options': <DropdownMenuItem<String>>[],
                      'category_options': <DropdownMenuItem<String>>[]
                    },
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return LoadingAccounts();
                      } else {
                        if (snapshot.data['account_options'].isEmpty) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Agrega Cuentas para poder generar transferencias",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 90,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await Navigator.of(context)
                                          .pushReplacementNamed('/Pages',
                                              arguments: 2);
                                    },
                                    child: Text(
                                      "Agregar",
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
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
                                        const Size(double.infinity, 60),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                        value:
                                            _currentSelectedValueTypeCategory,
                                        isDense: true,
                                        isExpanded: true,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _currentSelectedValueTypeCategory =
                                                newValue ??
                                                    _currentSelectedValueTypeCategory;
                                            var selectedCategory = categories
                                                .firstWhere((category) =>
                                                    category.id.toString() ==
                                                    _currentSelectedValueTypeCategory);
                                            //Asignamos la categoría
                                            transaction.category =
                                                selectedCategory;
                                            //Asignamos el id de la categoría
                                            transaction.categoryId =
                                                selectedCategory.id;
                                          });
                                          // print(_currentSelectedValueType);
                                        },
                                        items:
                                            snapshot.data['category_options'],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25, 15, 25, 10),
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                        labelText: widget.type ==
                                                TransactionType.transfer
                                            ? 'Cuenta Origen'
                                            : 'Cuenta',
                                        errorStyle: const TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFC1C4C4),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                            //Asignamos la transacción
                                            transaction.account =
                                                selectedAccount;
                                            //Asignamos el id de la transacción
                                            transaction.accountId =
                                                selectedAccount.id;
                                          });
                                          // print(_currentSelectedValueType);
                                        },
                                        items: [
                                          ...snapshot.data['account_options']
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                (widget.type == TransactionType.transfer)
                                    ? Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(25, 15, 25, 10),
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                              labelText: 'Cuenta Destino',
                                              errorStyle: const TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFC1C4C4),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFC1C4C4),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0))),
                                          isEmpty:
                                              _currentSelectedValueTypeDestination ==
                                                  '',
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value:
                                                  _currentSelectedValueTypeDestination,
                                              isDense: true,
                                              isExpanded: true,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _currentSelectedValueTypeDestination =
                                                      newValue ??
                                                          _currentSelectedValueTypeDestination;
                                                  var selectedAccount =
                                                      accounts.firstWhere(
                                                    (account) =>
                                                        account.id.toString() ==
                                                        _currentSelectedValueTypeDestination,
                                                  );
                                                  //Necesitamos otra transaccion
                                                  //Asignamos la transacción
                                                  // transaction.account =
                                                  //     selectedAccount;
                                                  // //Asignamos el id de la transacción
                                                  // transaction.accountId =
                                                  //     selectedAccount.id;
                                                });
                                              },
                                              items: [
                                                ...snapshot
                                                    .data['account_options']
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25, 15, 25, 10),
                                  child: TextFormField(
                                    controller: textController4,
                                    obscureText: false,
                                    onChanged: (value) {
                                      setState(() {
                                        transaction.amount =
                                            double.parse(value);
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
                                      final DateFormat formatter =
                                          DateFormat('yyyy-MM-dd');
                                      textController5?.value = TextEditingValue(
                                          text:
                                              formatter.format(selectedDated));
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
                                      if (formKey.currentState?.validate() ??
                                          false) {
                                        transaction
                                            .create()
                                            .then((value) async {
                                          //Mostramos que se ha creado correctamente
                                          if (value == 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Ocurrió un error'),
                                              ),
                                            );
                                          } else {
                                            //Actualizamos la cuenta
                                            if (transaction.account != null) {
                                              if (widget.type ==
                                                  TransactionType.deposit) {
                                                //Si es de credito debe disminuir el saldo y aumentar el balance
                                                if (transaction.account?.type ==
                                                    AccountType.credit) {
                                                  transaction.account
                                                      ?.saldo = (transaction
                                                              .account?.saldo ??
                                                          0) -
                                                      (transaction.amount ?? 0);
                                                }
                                                transaction.account?.balance +=
                                                    transaction.amount ?? 0;
                                              } else if (widget.type ==
                                                  TransactionType.transfer) {
                                                //Si es de credito debe disminuir el saldo y aumentar el balance
                                                if (transaction.account?.type ==
                                                    AccountType.credit) {
                                                  transaction.account
                                                      ?.saldo = (transaction
                                                              .account?.saldo ??
                                                          0) -
                                                      (transaction.amount ?? 0);
                                                }
                                                transaction.account?.balance +=
                                                    transaction.amount ?? 0;
                                              } else {
                                                transaction.account?.balance -=
                                                    transaction.amount ?? 0;
                                              }
                                              await transaction.account
                                                  ?.update();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Transacción creada correctamente'),
                                                ),
                                              );
                                              int count = 0;
                                              Navigator.of(context).popUntil(
                                                  (_) => count++ >= 2);
                                              await Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      '/Pages',
                                                      arguments: 3);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Lo sentimos algo salió mal'),
                                                ),
                                              );
                                            }
                                          }
                                        }).catchError((onError) {
                                          print(onError);
                                          setState(() {
                                            saving = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Lo sentimos algo salió mal'),
                                            ),
                                          );
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
                        // print(snapshot.data.toString());
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
