import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page/home_page.dart';
import '../forms_page/forms_page.dart';
import '../account_page/account_page.dart';
import '../../ui/widgets/app_bar.dart';
import '../../ui/widgets/keep_alive_page.dart';
import '../../ui/widgets/floating_action_button.dart';
import '../../../core/init/provider/page/page_provider.dart';
import '../../../core/constants/view/view_constants.dart';
import 'widgets/bottom_navigation_bar_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/mainPage';

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = context.watch<PageProvider>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(context, _buildHeaderText(pageProvider.routeName)),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavigationBarItem(
                context,
                routeName: HomePage.routeName,
                icon: const Icon(Icons.home),
                tooltip: "Ana Sayfa",
              ),
              bottomNavigationBarItem(
                context,
                routeName: FormsPage.routeName,
                icon: const Icon(Icons.notes),
                tooltip: "Formlar",
              ),
              const IconButton(onPressed: null, icon: SizedBox()),
              bottomNavigationBarItem(
                context,
                routeName: AccountsPage.routeName,
                icon: const Icon(Icons.link),
                tooltip: "Hesaplar",
              ),
              bottomNavigationBarItem(
                context,
                routeName: "SettingsPage.routeName",
                icon: const Icon(Icons.settings),
                tooltip: "Ayarlar",
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageProvider.controller,
          children: [
            const KeepAlivePage(child: HomePage()),
            const KeepAlivePage(child: FormsPage()),
            const KeepAlivePage(child: AccountsPage()),
            Container(
              color: kPrimaryColor,
            )
          ],
        ),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  String _buildHeaderText(String routeName) {
    try {
      switch (routeName) {
        case HomePage.routeName:
          return " Ana Sayfa";
        case FormsPage.routeName:
          return " Formlar";
        case AccountsPage.routeName:
          return " Hesaplar";
        // case //SettingsPage.routeName:
        //   return " Ayarlar";
        default:
          return "";
      }
    } catch (e) {
      return "Ana Sayfa";
    }
  }
}
