import 'package:flutter/material.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn(
      {Key? key,
      required this.width,
      required this.height,
      required this.label,
      required this.child,
      required this.onPressed})
      : super(key: key);

  final double width;
  final double height;
  final String label;
  final Widget child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Column(
        children: [
          SizedBox(width: width, height: height, child: child),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
