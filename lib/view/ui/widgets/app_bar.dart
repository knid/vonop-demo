import 'package:flutter/material.dart';
import 'package:vonop/core/constants/view/view_constants.dart';

AppBar appBar(BuildContext context, String headerText) => AppBar(
      centerTitle: false,
      title: Text(
        headerText,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('pressed profile photo'),
              backgroundColor: kPrimaryColor,
            ));
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF003E6B),
                    kPrimaryColor,
                  ],
                ),
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/pp.jpeg'))),
          ),
        ),
        const SizedBox(width: kDefaultPadding)
      ],
    );
