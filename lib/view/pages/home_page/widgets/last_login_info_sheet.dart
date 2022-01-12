import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/view/view_constants.dart';

Widget lastLoginInfoSheet(String lastLoginId) => Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            height: 5,
            width: 50,
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/hb_logo.png'),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      "hepsiburada.com",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(),
                    ),
                    const Icon(Icons.link)
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Text(
                  "Giriş Detayları",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
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
                    Text(" IP", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20)),
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
                // const SizedBox(
                //   height: kDefaultPadding / 2,
                // ),
                // const SizedBox(
                //   height: kDefaultPadding,
                // ),
                // SizedBox(
                //   height: 200,
                //   child: map(
                //     latitude: 41.0197,
                //     longitude: 28.9757,
                //     ignoreTouch: true,
                //     enableMark: false,
                //     zoom: 10,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
