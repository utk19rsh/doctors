import 'package:flutter/material.dart';
import 'package:doctors/constants.dart';

class Dots extends StatelessWidget {
  final double size;
  final Color color;
  final EdgeInsets margin;
  const Dots({
    Key? key,
    this.size = 5,
    this.color = black,
    this.margin = const EdgeInsets.all(3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  final bool isActive;
  const MyCheckBox(
    this.isActive, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? theme : grey.shade400,
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: white,
        ),
        width: 5,
        height: 5,
      ),
    );
  }
}
