import 'package:flutter/material.dart';

class Buttonfy extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisabled;
  const Buttonfy({Key? key, required this.text, required this.onPressed, required this.isDisabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Colors.grey[500],
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
