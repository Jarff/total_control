import 'package:flutter/material.dart';

class FFButtonOptions {
  double? width;
  double? height = 50;
  TextStyle? textStyle;
  Color? color;
  BorderSide? borderSide;
  double borderRadius = 0;

  FFButtonOptions(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.textStyle,
      this.borderSide,
      this.borderRadius = 0})
      : super();
}

Widget FFButtonWidget(
    {Function()? onPressed, String text = '', FFButtonOptions? options}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: options?.textStyle,
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        options?.color ?? const Color(0xFF00AFEE),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(options?.borderRadius ?? 0)),
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(options?.width ?? 50, options?.height ?? 50),
      ),
    ),
  );
}

// ElevatedButton(
//             onPressed: () async {
//             },
//             child: Text(
//               'Confirmar',
//               style: FlutterFlowTheme.bodyText1.override(
//                 fontSize: 18,
//               ),
//             ),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                 Color(0xFF00AFEE),
//               ),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                 ),
//               ),
//               minimumSize: MaterialStateProperty.all<Size>(
//                 Size(double.infinity, 55),
//               ),
//             ),
//           ),
