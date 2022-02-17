import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/view/ui/widgets/base_modal_popup.dart';

import '../../../../core/constants/view/view_constants.dart';

Widget lastLoginInfoSheet(String lastLoginId) => baseModalPopUp(
    image: const AssetImage("assets/hb_logo.png"),
    project: "hepsiburada.com",
    header: "Detaylar",
    content: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    // Text('Email:',
                    //     style: GoogleFonts.montserrat()),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Türkiye, İstanbul", style: GoogleFonts.montserrat())
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range),

                    // Text('Parola:',
                    //     style: GoogleFonts.montserrat()),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(
                      "12/09/2021 - 17:36",
                      style: GoogleFonts.montserrat(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(" IP",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20)),
                    // Text('Parola:',
                    //     style: GoogleFonts.montserrat()),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(
                      "176.234.226.191",
                      style: GoogleFonts.montserrat(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.device_unknown),

                    // Text('Parola:',
                    //     style: GoogleFonts.montserrat()),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(
                      "PC/Chrome",
                      style: GoogleFonts.montserrat(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.link),

            // Text('Parola:',
            //     style: GoogleFonts.montserrat()),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Text(
              "sinan_kanidagli@hotmail.com",
              style: GoogleFonts.montserrat(),
            ),
          ],
        ),
      ],
    ));
