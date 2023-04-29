import 'package:flutter/material.dart';

class CircularAva extends StatelessWidget {
  final double size;
  final Color color;
  final Icon icon;

  const CircularAva(
      {Key? key, required this.color, required this.icon, this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: icon,
      backgroundColor: color,
      radius: size,
    );
  }
}
