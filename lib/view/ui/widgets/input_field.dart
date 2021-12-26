import 'package:flutter/material.dart';
import 'package:vonop/view/ui/styles/search_bar_decoration.dart';

import '../../../core/constants/view/view_constants.dart';

Form inputField(
        {TextEditingController? textEditingController,
        String hintText = "",
        Widget? suffixIcon}) =>
    Form(
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: inputDecoration,
        child: Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding / 2),
          child: TextFormField(
            autofillHints: const [AutofillHints.name],
            controller: textEditingController,
            decoration: textFormFieldDecoration(
                hintText: hintText, suffixIcon: suffixIcon),
          ),
        ),
      ),
    );
