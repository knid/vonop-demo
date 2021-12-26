import 'package:flutter/material.dart';

import '../../../view/pages/account_page/account_page.dart';
import '../../../view/pages/forms_page/forms_page.dart';
import '../../../view/pages/home_page/home_page.dart';

class PageProvider extends ChangeNotifier {
  final PageController controller = PageController(initialPage: 1);
  String _routeName = FormsPage.routeName;

  String get routeName => _routeName;

  void setPage(String routeName) {
    switch (routeName) {
      case HomePage.routeName:
        controller.jumpToPage(0);
        break;
      case FormsPage.routeName:
        controller.jumpToPage(1);
        break;
      case AccountsPage.routeName:
        controller.jumpToPage(2);
        break;
      // case SettingsPage.routeName:
      //   controller.jumpToPage(3);
      //   break;
      default:
        break;
    }
    _routeName = routeName;
    notifyListeners();
  }
}
