import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/core/constants/view/view_constants.dart';

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
InputDecoration textFormFieldDecoration({
  String? labelText,
  Widget? suffixIcon,
  bool enableFloatingLabelText = false,
  EdgeInsetsGeometry? contentPadding,
}) =>
    InputDecoration(
      labelText: enableFloatingLabelText ? labelText : null,
      hintText: enableFloatingLabelText ? null : labelText,
      floatingLabelStyle: GoogleFonts.montserrat(color: kPrimaryColor),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: contentPadding,
    );
