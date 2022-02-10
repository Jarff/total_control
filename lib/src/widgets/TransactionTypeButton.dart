import 'package:flutter/material.dart';

class TransactionTypeButton extends StatefulWidget {
  String title;
  String type;
  Icon icon;
  TransactionTypeButton(
      {Key? key, required this.title, required this.type, required this.icon})
      : super(key: key);

  @override
  State<TransactionTypeButton> createState() => _TransactionTypeButtonState();
}

class _TransactionTypeButtonState extends State<TransactionTypeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Navigator.of(context)
            .pushNamed('/AddTransaction', arguments: widget.type);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.icon,
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const Icon(Icons.arrow_forward_ios,
              color: Color(0xFFA1B1C9), size: 20)
        ],
      ),
    );
  }
}
