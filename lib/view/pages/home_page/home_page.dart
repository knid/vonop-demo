import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/view/view_constants.dart';
import '../../../core/init/provider/form/form_provider.dart';
import '../account_page/account_page.dart';
import '../forms_page/forms_page.dart';
import 'widgets/info_card.dart';
import 'widgets/last_login_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = context.watch<FormProvider>();
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kDefaultPadding,
          ),
          infoCard(
            context,
            routeName: AccountsPage.routeName,
            headerText: "Hesaplar",
            contentText: "Sahip olunan tüm \nhesaplar",
            number: 13,
            gradient: const LinearGradient(
              colors: [
                kSecondColor,
                kPrimaryColor,
              ],
            ),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          infoCard(
            context,
            routeName: FormsPage.routeName,
            headerText: "Formlar",
            contentText: "Sahip olunan tüm \nkayıt formları",
            number: formProvider.forms.length,
            gradient: const LinearGradient(
              colors: [
                kPrimaryColor,
                kSecondColor,
              ],
            ),
          ),
          const SizedBox(
            height: kDefaultPadding * 2,
          ),
          Text(
            "Son Eylemler",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  15,
                  (index) => Column(
                    children: [
                      lastLoginCard(context, "lastLoginId"),
                      const SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      const Divider(
                        height: 3,
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
