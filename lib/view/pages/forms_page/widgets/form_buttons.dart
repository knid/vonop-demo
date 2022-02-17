import 'package:flutter/material.dart';
import 'package:vonop/models/session/session_credentials.dart';
import 'package:vonop/view/pages/authorize_page/register/authorize_page.dart';

import '../../../../core/constants/view/view_constants.dart';
import '../../authorize_page/login/authorize_page.dart';
import 'form_button.dart';
import 'form_info_sheet.dart';

Widget formButtons(BuildContext context) => Container(
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) {
                    return formInfoSheet(context);
                  });
            },
          ),
          formButton(
            text: "Rastgele Form",
            icon: const Icon(Icons.shuffle, color: Colors.white),
            onPress: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) {
                    return registerAuthorizeSheet(context,
                        credentials: SessionCredentials("publicKey", "sessionKey"));
                  });
            },
          ),
          formButton(
            text: "Kopya Form",
            icon: const Icon(Icons.content_copy, color: Colors.white),
            onPress: () {},
          ),
        ],
      ),
    );
