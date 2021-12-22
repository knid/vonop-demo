import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/view/view_constants.dart';

Widget infoSheet(String accountId) => Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
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
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("hepsiburada.com",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat()),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.link)
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Text(
                  "Giriş Bilgileri",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    // Text('Email:',
                    //     style: GoogleFonts.montserrat()),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("sinan_kanidagli@hotmail.com",
                        style: GoogleFonts.montserrat())
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
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, color: Colors.grey),
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
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
