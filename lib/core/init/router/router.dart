import 'package:flutter/material.dart';

import '../app/app.dart';
// import 'package:vonop/view/pages/account_page/account_page.dart';
// import 'package:vonop/view/pages/forms_page/forms_page.dart';
// import 'package:vonop/view/pages/main_page/main_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case App.routeName:
        return MaterialPageRoute(builder: (_) => const App());
      // case MainPage.routeName:
      //   return MaterialPageRoute(builder: (_) => MainPage());
      // case FormsPage.routeName:
      //   return MaterialPageRoute(builder: (_) => const FormsPage());
      // case AccountsPage.routeName:
      //   return MaterialPageRoute(builder: (_) => const AccountsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
