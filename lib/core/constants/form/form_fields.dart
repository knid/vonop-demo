import 'package:flutter/material.dart';
import 'package:vonop/view/ui/widgets/input_field.dart';

class FormFields {
  static Widget get nameAndLastName => const _NameAndLastName();
}

class _NameAndLastName extends StatelessWidget {
  const _NameAndLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: inputField(
              hintText: "İsim",
              suffixIcon: GestureDetector(
                onTap: () => print('delete'),
                child: const Icon(Icons.delete, color: Colors.red),
              )),
        ),
        Expanded(
          child: inputField(
              hintText: "Soyisim",
              suffixIcon: GestureDetector(
                onTap: () => print('delete'),
                child: const Icon(Icons.delete, color: Colors.red),
              )),
        ),
      ],
    );
  }
}
