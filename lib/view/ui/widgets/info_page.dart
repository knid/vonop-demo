import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/view/view_constants.dart';
import '../../../core/init/app/app.dart';

Widget infoPage(BuildContext context,
        {required String header,
        required String content,
        required String svgPath,
        bool last = false}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 300, child: SvgPicture.asset(svgPath)),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Text(header, style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(content,
                style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center),
            if (last)
              Column(
                children: [
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  MaterialButton(
                    color: kPrimaryColor,
                    onPressed: () async {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setBool('firstLaunch', false);
                      await FirebaseMessaging.instance.requestPermission();
                      Navigator.of(context).pushReplacementNamed(App.routeName);
                    },
                    child: Text(
                      'Hemen Başla',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
