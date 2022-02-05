import 'package:flutter/material.dart';

Widget FlutterFlowIconButton(
    {Color? borderColor,
    double? borderRadius,
    double? borderWidth,
    required double buttonSize,
    Color? fillColor,
    required Icon icon,
    required Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        backgroundColor: fillColor,
        minimumSize: Size(buttonSize, buttonSize),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        )),
    child: icon,
  );
}
