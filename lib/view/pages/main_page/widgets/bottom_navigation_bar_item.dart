import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/view/view_constants.dart';
import '../../../../core/init/provider/page/page_provider.dart';

Widget bottomNavigationBarItem(BuildContext context,
        {required String routeName, required Icon icon, String tooltip = ""}) =>
    SizedBox(
      height: 55,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              context.read<PageProvider>().setPage(routeName);
            },
            icon: icon,
            tooltip: tooltip,
            splashColor: Colors.transparent,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 4,
            width: context.read<PageProvider>().routeName == routeName ? 40 : 0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 5), color: kPrimaryColor, blurRadius: 10),
              ],
            ),
          )
        ],
      ),
    );
