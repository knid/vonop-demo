import 'package:flutter/material.dart';

import '../initialize.dart';
import '../../constants/view/view_constants.dart';
import '../../constants/enums/initialize_app_result_type_enum.dart';
import '../../../view/pages/login_register/welcome_page.dart';
import '../../../view/pages/main_page/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize App:
      future: Initialize.initializeApp(context),
      builder: (context, AsyncSnapshot<ResultType> snapshot) {
        // TODO: Check for errors
        if (snapshot.hasError) {
          return const Center();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            switch (snapshot.data!) {
              case ResultType.NO_ERROR:
                return const MainPage();

              case ResultType.NOT_LOGIN:
                // TODO: Handle this case.
                break;
              case ResultType.TOKEN_EXPIRED:
                // TODO: Handle this case.
                break;
              case ResultType.NO_INTERNET:
                // TODO: Handle this case.
                break;
              case ResultType.NO_NOTIFICATION_PERMISSION:
                // TODO: Handle this case.
                break;
              case ResultType.FIRST_LAUNCH:
                return WelcomePage();
            }
          }
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
