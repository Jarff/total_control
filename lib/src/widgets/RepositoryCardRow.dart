import 'package:control_total/src/helpers/helper.dart';
import 'package:control_total/src/models/Account.dart';
import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class RepositoryCardRow extends StatefulWidget {
  Account account;
  RepositoryCardRow({Key? key, required this.account}) : super(key: key);

  @override
  _RepositoryCardRowState createState() => _RepositoryCardRowState();
}

class _RepositoryCardRowState extends State<RepositoryCardRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 35, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              await Navigator.of(context).pushNamed('/DetailAccount');
            },
            child: Container(
              width: 125,
              height: 75,
              decoration: BoxDecoration(
                color: const Color(0xFF1B2024),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0x39171717),
                  )
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.account.name.toUpperCase(),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
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
                '\$${Helper.numberFormat(widget.account.balance.toStringAsFixed(2))}',
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
