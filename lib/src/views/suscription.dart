import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:control_total/themes/widgets/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';

class SuscriptionPageWidget extends StatefulWidget {
  const SuscriptionPageWidget({Key? key}) : super(key: key);

  @override
  _SuscriptionPageWidgetState createState() => _SuscriptionPageWidgetState();
}

class _SuscriptionPageWidgetState extends State<SuscriptionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFFBF9F5),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 50,
                  color: Color(0x2A171717),
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 2),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$516',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Por pagar',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: const Color(0xFF676767),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFAEEAB7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text(
                      '75%',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$1,787',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Pagado',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lato',
                          color: const Color(0xFF676767),
                          fontSize: 12,
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
          padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Este mes',
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
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF9F5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x12171717),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFAEEAB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        Text(
                          'Netflix',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$250',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '22',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF0B1652),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF9F5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x12171717),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFAEEAB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        Text(
                          'Amazon',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$99',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '15',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF676767),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF9F5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x12171717),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEABBAE),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            '!',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Crounchy Roll',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$120',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '28',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF676767),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF9F5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x12171717),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFAEEAB7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        Text(
                          'Santander',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$1,250',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '30',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF676767),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF9F5),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 40,
                        color: Color(0x12171717),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEABBAE),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            '!',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Paramount',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '\$99',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '15',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFF676767),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
