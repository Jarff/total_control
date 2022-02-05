import 'package:control_total/themes/flutter_flow_theme.dart';
import 'package:control_total/themes/widgets/ff_button_widget.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xFF1B2024),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25, 50, 25, 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://picsum.photos/seed/902/600',
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                child: Text(
                  'La Mejor Manera De Gestionar Tus Financas',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: FFButtonWidget(
                  onPressed: () async {
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => GetStarted1Widget(),
                    //   ),
                    // );
                  },
                  text: 'Iniciar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: const Color(0xFFBCEAC3),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Montserrat',
                      color: const Color(0xFF1B2024),
                      fontSize: 20,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.of(context)
                          .pushReplacementNamed('/Pages');
                    },
                    child: const Text(
                      "Omitir",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
