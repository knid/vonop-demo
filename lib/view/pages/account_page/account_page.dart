import 'package:flutter/material.dart';

import 'widgets/account_card.dart';
import '../../ui/widgets/input_field.dart';
import '../../../core/constants/view/view_constants.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          const InputField(
              labelText: "Arama",
              suffixIcon: Icon(
                Icons.search,
                color: kPrimaryColor,
              )),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
              child: ListView(
            children: [
              accountCard(context, "accountId"),
              accountCard(context, "accountId"),
            ],
          ))
        ],
      ),
    );
  }
}
