import 'package:flutter/material.dart';
import 'package:doctors/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double aspectRatio;
  final VoidCallback onTap;
  const MyButton({
    Key? key,
    this.text = "Make an appointment",
    this.aspectRatio = 5,
   required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 5,
            shadowColor: orange.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: orange,
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 10,
                //     color: orange.withOpacity(0.1),
                //     spreadRadius: 10,
                //     blurStyle: BlurStyle.inner,
                //   ),
                // ],
              ),
              child: Text(
                text,
                style: const TextStyle(
                  color: white,
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
