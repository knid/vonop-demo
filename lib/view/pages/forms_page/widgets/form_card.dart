import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/styles/card_decoration.dart';
import '../../../../core/constants/view/view_constants.dart';

Widget formCard(context,
        {required String formId, required int index, bool slidable = true}) =>
    Container(
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: cardDecoration,
      child: Slidable(
        enabled: slidable,
        key: ValueKey(index),
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Genel Formum",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const Expanded(
                    child: Icon(Icons.notes),
                  ),
                ],
              ),
              const SizedBox(
                height: kDefaultPadding / 3,
              ),
              Text(
                "Sinan Kanidağlı",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                    color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                "SinanK0",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
              Text(
                "sinan_kanidagli@hotmail.com",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
              Text(
                "+90 536 491 42 79 ....",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
            ],
          ),
        ),
      ),
    );
