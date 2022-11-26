import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.minimumValue,
      required this.onPressed,
      this.height = 35,
      required this.width,
      required this.label})
      : super(key: key);

  final double minimumValue;
  final Function onPressed;
  final double width;
  final double height;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: (onPressed()),
        child: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: minimumValue),
        ),
      ),
    );
  }
}
