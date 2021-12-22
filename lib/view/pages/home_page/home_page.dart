import 'package:flutter/material.dart';

import 'widgets/info_card.dart';
import 'widgets/last_login_card.dart';
import '../forms_page/forms_page.dart';
import '../account_page/account_page.dart';
import '../../../core/constants/view/view_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
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
            contentText: "Vonop ile kayıt olunan\nhesaplar",
            number: 13,
            gradient: const LinearGradient(
              colors: [
                kPrimaryColor,
                Color(0xFF003E6B),
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
            contentText: "Sahip Olunan tüm \nkayıt formları",
            number: 4,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF003E6B),
                kPrimaryColor,
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
