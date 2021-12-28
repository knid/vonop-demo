import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vonop/core/constants/form_fields/form_fields.dart';
import 'package:vonop/core/extension/map_extension.dart';
import 'package:vonop/core/init/provider/form_provider.dart';
import 'package:vonop/models/form/form.dart' as model;
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/action_modal_bottom_sheet.dart';
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/sheet_action.dart';

import 'widgets/form_card.dart';
import 'widgets/form_button.dart';
import '../../ui/widgets/input_field.dart';
import '../../../core/constants/view/view_constants.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  static const routeName = '/forms';

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = context.watch<FormProvider>();
    return FutureBuilder<List<model.Form>>(
      future: formProvider.getAll(),
      builder: (context, AsyncSnapshot<List<model.Form>> snapshot) {
        if (snapshot.hasError) {
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
            await Future.delayed(const Duration(seconds: 1));
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.height * .15,
                        child: Image.asset('assets/app_logo_t.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .17,
                        width: MediaQuery.of(context).size.height * .17,
                        child: const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  );
                });
          });
        }

        return Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(children: <Widget>[
            inputField(
                hintText: "Arama",
                suffixIcon: const Icon(
                  Icons.search,
                  color: kPrimaryColor,
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  formButton(
                    text: "Yeni Form",
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPress: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: ChangeNotifierProvider<FormFieldsProvider>(
                                create: (context) => FormFieldsProvider(),
                                builder: (context, child) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: kDefaultPadding / 2),
                                        height: 5,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.85,
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: Form(
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                kDefaultPadding),
                                            child: ListView(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Yeni Form",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        FormFieldsProvider
                                                            formFieldsProvider =
                                                            context.read<
                                                                FormFieldsProvider>();
                                                        showPlatformSpecificModalBottomSheetWithActions(
                                                            context,
                                                            title: const Text(
                                                                "Alan Ekle"),
                                                            description: Text(formFieldsProvider
                                                                    .structure
                                                                    .isValuesNull
                                                                ? "Tüm alanları eklediniz"
                                                                : "Eklemek istediğiniz alanları seçin."),
                                                            actions: <
                                                                SheetAction>[
                                                              SheetAction(
                                                                const Text(
                                                                    'İsim Soyisim'),
                                                                () {
                                                                  formFieldsProvider.structure = formFieldsProvider
                                                                      .structure
                                                                      .copyWith(
                                                                          'name',
                                                                          FormFieldsProvider
                                                                              .nameAndLastName);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ],
                                                            cancelButton: SheetAction(
                                                                const Text(
                                                                    'İptal'),
                                                                () => Navigator
                                                                    .pop(
                                                                        context)));
                                                      },
                                                      child: Container(
                                                        width: 90,
                                                        height: 30,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Text("Alan Ekle",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: kDefaultPadding,
                                                ),
                                                for (var field in context
                                                    .watch<FormFieldsProvider>()
                                                    .structure
                                                    .values)
                                                  if (field != null) field,
                                                const SizedBox(
                                                  height: kDefaultPadding,
                                                ),
                                                const Text("*Zorunlu alanlar"),
                                                MaterialButton(
                                                  color: kPrimaryColor,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Kaydet",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                ),
                                                MaterialButton(
                                                  color: Colors.red,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Sil",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          });
                    },
                  ),
                  formButton(
                    text: "Rastgele Form",
                    icon: const Icon(Icons.shuffle, color: Colors.white),
                    onPress: () {
                      print("test");
                    },
                  ),
                  formButton(
                    text: "Kopya Form",
                    icon: const Icon(Icons.content_copy, color: Colors.white),
                    onPress: () {},
                  ),
                ],
              ),
            ),
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
