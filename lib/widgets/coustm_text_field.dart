import 'package:flutter/material.dart';
import 'package:unipal/constans/colors.dart';

class CoustmTextField extends StatelessWidget {
  const CoustmTextField({
    super.key,
    required this.text,
    this.icon,
    this.iconbt,
    this.obscureText = true,
    this.controller,
  });
  final String text;
  final IconData? icon;
  final Widget? iconbt;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'feild is requird';
        } else {
          return null;
        }
      },
      controller: controller,
      style: TextStyle(color: Appcolors.whitecolor),
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: Icon(icon, color: Appcolors.whitecolor),
        suffixIcon: iconbt,
        labelText: text,
        labelStyle: TextStyle(
          color: Appcolors.whitecolor,
          fontFamily: 'Poppins',
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.25, color: Appcolors.graycolor),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
