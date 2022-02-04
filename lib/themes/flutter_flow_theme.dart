import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterFlowTheme {
  static BodyText bodyText1 = BodyText();
  static BodyText subtitle2 = BodyText();
  static Color tertiaryColor = Color(0xFF383041);
}

class BodyText extends TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    double? fontSize,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontSize: fontSize);
  }
}
