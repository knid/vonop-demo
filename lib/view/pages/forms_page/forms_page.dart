import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vonop/core/init/provider/form/form_provider.dart';
import 'package:vonop/models/form/form.dart' as model;
import 'package:vonop/view/pages/forms_page/widgets/form_buttons.dart';

import 'widgets/form_card.dart';
import '../../ui/widgets/input_field.dart';
import '../../../core/constants/view/view_constants.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  static const routeName = '/forms';

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = context.read<FormProvider>();
    return FutureBuilder<List<model.Form>>(
      future: formProvider.getAll(),
      builder: (context, AsyncSnapshot<List<model.Form>> snapshot) {
        return Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(children: <Widget>[
            const InputField(
                labelText: "Arama",
                suffixIcon: Icon(Icons.search, color: kPrimaryColor)),
            formButtons(context),
            if (snapshot.hasData)
              Expanded(
                child: ListView(
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => formCard(context,
                        form: snapshot.data![index], index: index),
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
