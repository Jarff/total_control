import 'package:control_total/src/models/Account.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DebitCardRow extends StatefulWidget {
  Account account;
  DebitCardRow({Key? key, required this.account}) : super(key: key);

  @override
  State<DebitCardRow> createState() => _DebitCardRowState();
}

class _DebitCardRowState extends State<DebitCardRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 35, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 125,
            height: 75,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0x39171717),
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
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.account.name.toUpperCase(),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        widget.account.red?.toUpperCase() ?? "",
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "",
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'BALANCE',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFFA1B1C9),
                  fontSize: 12,
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
        ],
      ),
    );
  }
}
