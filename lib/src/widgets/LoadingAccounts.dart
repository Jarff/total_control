import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAccounts extends StatelessWidget {
  const LoadingAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Valor neto
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              color: Colors.white,
            ),
          ),
        ),
        //Subtitulo tipo de cuenta
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .40,
                  height: 20.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        //Ejemplo de tarjeta (1)
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
            child: Row(
              children: [
                Container(
                  width: 125,
                  height: 75,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Container(
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //Ejemplo de tarjeta (2)
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
            child: Row(
              children: [
                Container(
                  width: 125,
                  height: 75,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Container(
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //Subtitulo tipo de cuenta
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .40,
                  height: 20.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        //Ejemplo de tarjeta (1)
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
            child: Row(
              children: [
                Container(
                  width: 125,
                  height: 75,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Container(
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //Ejemplo de tarjeta (2)
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
            child: Row(
              children: [
                Container(
                  width: 125,
                  height: 75,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Container(
                      height: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
