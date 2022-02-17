import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/init/provider/form/form_provider.dart';
import '../../../models/form/form.dart' as model;
import 'widgets/form_buttons.dart';

import 'widgets/form_card.dart';
import '../../ui/widgets/input_field.dart';
import '../../../core/constants/view/view_constants.dart';
import 'widgets/form_info_sheet.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  static const routeName = '/forms';

  @override
  Widget build(BuildContext context) {
    print("build");
    return FutureBuilder<List<model.Form>>(
      future: context.read<FormProvider>().getAll(),
      builder: (context, AsyncSnapshot<List<model.Form>> snapshot) {
        FormProvider formProvider = context.watch<FormProvider>();

        if (snapshot.hasError) {
          print(snapshot.error);
        }

        return Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(children: <Widget>[
            const InputField(
                labelText: "Arama", suffixIcon: Icon(Icons.search, color: kPrimaryColor)),
            formButtons(context),
            if (snapshot.hasData)
              Expanded(
                child: ListView(
                  children: List.generate(
                    formProvider.forms.length,
                    (index) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              context: context,
                              builder: (context) {
                                return formInfoSheet(context,
                                    initialData: formProvider.forms[index]);
                              });
                        },
                        child: formCard(
                          context,
                          form: formProvider.forms[index],
                          index: index,
                        )),
                  ),
                ),
              ),
            if (!snapshot.hasData)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              ),
          ]),
        );
      },
    );
  }
}
