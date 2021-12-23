import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vonop/core/init/provider/form_provider.dart';
import 'package:vonop/models/form/form.dart' as model;

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
          //TODO:check error
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
                            ValueNotifier<bool> _value =
                                ValueNotifier<bool>(false);
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Column(
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
                                    height: MediaQuery.of(context).size.height *
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
                                            Text(
                                              "Yeni Form",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                            ),
                                            const SizedBox(
                                              height: kDefaultPadding,
                                            ),
                                            inputField(hintText: "*Form İsmi"),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: inputField(
                                                        hintText: "İsim")),
                                                Expanded(
                                                    child: inputField(
                                                        hintText: "Soyisim")),
                                              ],
                                            ),
                                            inputField(hintText: "Form İsmi"),
                                            inputField(hintText: "Form İsmi"),
                                            inputField(hintText: "Form İsmi"),
                                            inputField(hintText: "Form İsmi"),
                                            inputField(hintText: "Form İsmi"),
                                            ValueListenableBuilder(
                                                valueListenable: _value,
                                                builder: (context, value, _) {
                                                  return CupertinoSwitch(
                                                      value: _value.value,
                                                      onChanged: (val) {
                                                        _value.value =
                                                            !_value.value;
                                                      });
                                                }),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
