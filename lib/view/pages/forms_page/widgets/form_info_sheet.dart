import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vonop/core/constants/view/view_constants.dart';
import 'package:vonop/core/extension/map_extension.dart';
import 'package:vonop/core/init/provider/form/form_fields_provider.dart';
import 'package:vonop/core/init/provider/form/form_provider.dart';
import 'package:vonop/view/pages/forms_page/widgets/add_field_actions.dart';
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/action_modal_bottom_sheet.dart';
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/sheet_action.dart';

import 'package:vonop/models/form/form.dart' as model;

Widget formInfoSheet(BuildContext context, {Form? initialData}) {
  return GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: ChangeNotifierProvider<FormFieldsProvider>(
      create: (context) => FormFieldsProvider(),
      builder: (context, child) {
        FormFieldsProvider _formFieldsProvider = context.read<FormFieldsProvider>();
        _formFieldsProvider.structure['form_name'] = _formFieldsProvider.formName;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: kDefaultPadding / 2),
              height: 5,
              width: 50,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AutofillGroup(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Yeni Form",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            GestureDetector(
                              onTap: () {
                                FormFieldsProvider formFieldsProvider = context.read<FormFieldsProvider>();
                                formFieldsProvider.structure['form_name'] = formFieldsProvider.formName;

                                showPlatformSpecificModalBottomSheetWithActions(context,
                                    title: const Text("Alan Ekle"),
                                    description: Text(
                                        formFieldsProvider.structure.isValuesNull ? "Eklemek istediğiniz alanları seçin." : "Tüm alanları eklediniz"),
                                    actions: sheetActions(context),
                                    cancelButton: SheetAction(const Text('İptal'), () => Navigator.pop(context)));
                              },
                              child: Container(
                                width: 90,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
                                child: Text("Alan Ekle", style: GoogleFonts.montserrat(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        for (var field in context.watch<FormFieldsProvider>().structure.values)
                          if (field != null) field,
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text("*Zorunlu alanlar"),
                        MaterialButton(
                          color: kPrimaryColor,
                          onPressed: () {
                            FormFieldsProvider formFieldsProvider = context.read<FormFieldsProvider>();
                            Map<String, Widget?> structure = formFieldsProvider.structure;
                            Map<String, dynamic> json = {};
                            for (var key in structure.keys) {
                              if (structure[key] != null) {
                                json[key] = formFieldsProvider.textEditingControllers[key]?.text;
                              }
                            }
                            if (structure['name'] != null) {
                              json['first_name'] = formFieldsProvider.textEditingControllers['name']!.text;
                              json['last_name'] = formFieldsProvider.textEditingControllers['last_name']!.text;
                            }
                            context.read<FormProvider>().add(model.Form.fromJson(json));
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Kaydet",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        MaterialButton(
                          color: Colors.red,
                          onPressed: () {},
                          child: Text(
                            "Sil",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
