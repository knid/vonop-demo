import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/core/constants/view/view_constants.dart';

Widget baseModalPopUp(
        {required ImageProvider image,
        required String project,
        String? header,
        required Widget content}) =>
    Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            height: 5,
            width: 50,
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text(
                    project,
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
                header ?? "",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
              content
            ]),
          ),
        ]));
