import 'package:flutter/material.dart';
import 'package:doctors/constants.dart';



class CustomTextField extends StatelessWidget {
  final BoxConstraints prefixConstraints;
  final Widget prefixIcon;
  final String hintText;
  const CustomTextField(
    this.searchController, {
    Key? key,
    required this.prefixConstraints,
    required this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 18,
      controller: searchController,
      decoration: InputDecoration(
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
        fillColor: white,
        filled: true,
        contentPadding: const EdgeInsets.all(17.5),
        prefixIconConstraints: prefixConstraints,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontSize: 18,
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: trans,
        width: double.minPositive,
      ),
    );
  }
}
