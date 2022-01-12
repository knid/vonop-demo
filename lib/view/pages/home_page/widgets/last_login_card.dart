import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'last_login_info_sheet.dart';
import '../../../../core/constants/view/view_constants.dart';

Widget lastLoginCard(BuildContext context, String lastLoginId) => GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) {
              return lastLoginInfoSheet(lastLoginId);
            });
      },
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Image(image: AssetImage('assets/hb_logo.png')),
                ),
                const SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Text(
                  'hepsiburada.com',
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
                const SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Text(
                  '03/11/2021',
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
                const SizedBox(
                  width: kDefaultPadding / 2,
                ),
                //const Icon(Icons.block, color: Colors.red, size: 16),
                //const Icon(Icons.check, color: Colors.green, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
