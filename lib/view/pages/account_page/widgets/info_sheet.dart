import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/view/ui/widgets/base_modal_popup.dart';

import '../../../../core/constants/view/view_constants.dart';

Widget infoSheet(String accountId) => baseModalPopUp(
    image: const AssetImage("assets/hb_logo.png"),
    project: "hepsiburada.com",
    header: "Giriş Bilgileri",
    content: Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            // Text('Email:',
            //     style: GoogleFonts.montserrat()),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Text("sinan_kanidagli@hotmail.com", style: GoogleFonts.montserrat())
          ],
        ),
        const SizedBox(
          height: kDefaultPadding / 4,
        ),
        Row(
          children: [
            const Icon(Icons.vpn_key),
            // Text('Parola:',
            //     style: GoogleFonts.montserrat()),
            const SizedBox(
              width: kDefaultPadding,
            ),
            GestureDetector(
              onTap: () {
                debugPrint('see');
              },
              child: Text(
                "Görüntülemek için tıklayın",
                style: GoogleFonts.montserrat(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          children: [
            Text(
              "Oluşturulma Tarihi:  ",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
            Text(
              "06/9/2021",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Son Kullanım:            ",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
            Text(
              "11/9/2021",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ],
        )
      ],
    ));
