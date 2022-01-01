import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/view/ui/styles/input_decoration.dart';

import '../../../core/constants/view/view_constants.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.labelText,
      this.enableFloatingLabelText = false,
      this.suffixIcon,
      this.height = 50,
      this.contentPadding = const EdgeInsets.all(15),
      this.textEditingController,
      this.keyboardType,
      this.obscureText = false,
      this.autoCorrect = true,
      this.maxLines = 1,
      this.maxLength,
      this.autoFillHints,
      this.validator})
      : super(key: key);

  final String? labelText;
  final bool enableFloatingLabelText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double height;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autoCorrect;
  final int maxLines;
  final int? maxLength;
  final List<String>? autoFillHints;
  final String? Function(String?)? validator;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool focused = false;
  int textLength = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          height: widget.height,
          decoration: inputDecoration,
        ),
        Container(
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          child: TextFormField(
            style: GoogleFonts.montserrat(color: Colors.black),
            autofillHints: widget.autoFillHints,
            controller: widget.textEditingController,
            decoration: textFormFieldDecoration(
                labelText: widget.labelText,
                suffixIcon: widget.suffixIcon,
                enableFloatingLabelText: widget.enableFloatingLabelText,
                contentPadding: widget.contentPadding),
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            autocorrect: widget.autoCorrect,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            validator: widget.validator,
            buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) {
              if (focused != isFocused) {
                Future.delayed(Duration.zero, () {
                  setState(() {
                    focused = isFocused;
                  });
                });
              }
              if (textLength != currentLength) {
                Future.delayed(Duration.zero, () {
                  setState(() {
                    textLength = currentLength;
                  });
                });
              }
            },
          ),
        ),
        if (focused && widget.maxLength != null)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 4),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "$textLength/${widget.maxLength}",
                style:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 10),
              ),
            ),
          )
      ],
    );
  }
}
