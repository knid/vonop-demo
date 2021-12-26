import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/init/provider/page_provider.dart';
import '../../../../core/constants/view/view_constants.dart';

Widget infoCard(BuildContext context,
        {required String routeName,
        bool loaded = true,
        required String headerText,
        required String contentText,
        required int number,
        required LinearGradient gradient}) =>
    GestureDetector(
      onTap: () {
        context.read<PageProvider>().setPage(routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        height: 100,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: kPrimaryColor,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headerText, style: Theme.of(context).textTheme.headline4),
                Text(contentText, style: Theme.of(context).textTheme.headline5),
              ],
            ),
            Row(
              children: [
                if (loaded)
                  Text(
                    number.toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                if (!loaded)
                  const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                const SizedBox(
                  width: 10,
                ),
                Container(height: 30, width: 1, color: Colors.grey),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.manage_search,
                    color: Color(0xFF47A7EA),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
