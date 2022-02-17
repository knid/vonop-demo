import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/view/view_constants.dart';
import '../../../ui/styles/card_decoration.dart';
import 'info_sheet.dart';

Widget accountCard(context, accountId) => GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) {
              return infoSheet(accountId);
            });
      },
      child: Container(
        margin: const EdgeInsets.all(kDefaultPadding / 2),
        height: 80,
        decoration: cardDecoration,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: kDefaultPadding),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/hb_logo.png'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("hepsiburada.com",
                            overflow: TextOverflow.ellipsis, style: GoogleFonts.montserrat()),
                        Text(
                          "sinan_kanidagli@hotmail.com",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: Icon(Icons.link))
                ],
              ),
            )
          ],
        ),
      ),
    );
