import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final BoxDecoration inputDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      offset: const Offset(0, 10),
      blurRadius: 20,
    ),
  ],
);
InputDecoration textFormFieldDecoration(
        {String? hintText, Widget? suffixIcon}) =>
    InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: suffixIcon,
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.montserrat(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
