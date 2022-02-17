import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/models/session/session_credentials.dart';
import 'package:vonop/view/pages/home_page/widgets/last_login_info_sheet.dart';
import 'package:vonop/view/ui/widgets/base_modal_popup.dart';
import '../../../../core/constants/view/view_constants.dart';
import '../../../ui/widgets/map.dart';

Widget LoginAuthorizeSheet(BuildContext context, {required SessionCredentials credentials}) {
  return baseModalPopUp(
      image: const AssetImage("assets/hb_logo.png"),
      project: "hepsiburada.com",
      header: "Giriş izni",
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
            height: kDefaultPadding,
          ),
          SizedBox(
            height: 200,
            child: map(
              latitude: 41.0197,
              longitude: 29.01,
              ignoreTouch: true,
              enableMark: false,
              zoom: 9,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.link),
                  const SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Text(
                    'sinan_kanidagli@hotmail.com',
                    style: GoogleFonts.montserrat(),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Reddet",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: MaterialButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return FutureBuilder(
                              future: Future.delayed(
                                const Duration(seconds: 2),
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  Future.delayed(const Duration(seconds: 1), () {
                                    if (Navigator.of(context).canPop()) {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          color: kPrimaryColor,
                                          size: 80,
                                        ),
                                        const SizedBox(
                                          height: kDefaultPadding,
                                        ),
                                        Text(
                                          "Başarıyla giriş yaptınız.",
                                          style: Theme.of(context).textTheme.headline6,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: kPrimaryColor,
                                      ),
                                    ));
                              },
                            );
                            ;
                          });
                    },
                    child: Text(
                      "İzin Ver",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "*Eğer bu işlemi siz gerçekleştirmediyseniz lütfen bizimle ileşitime geçiniz.",
            style: GoogleFonts.montserrat(color: Colors.grey),
          )
        ],
      ));
}
