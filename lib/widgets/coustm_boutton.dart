import 'package:flutter/material.dart';
import 'package:unipal/constans/colors.dart';
import 'package:unipal/constans/strings.dart';
import 'package:unipal/widgets/coustm_text.dart';

class CoustmBoutton extends StatelessWidget {
  const CoustmBoutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, homeScreen);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0073C6),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        shadowColor: Colors.black,
      ),
      child: CoustmText(
        text: "Log in",
        color: Appcolors.whitecolor,
        textsize: 14,
      ),
    );
  }
}
