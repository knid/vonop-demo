import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vonop/models/form/form.dart' as model;

import '../../../ui/styles/card_decoration.dart';
import '../../../../core/constants/view/view_constants.dart';

Widget formCard(context,
    {required model.Form form, required int index, bool slidable = true}) {
  return Container(
    margin: const EdgeInsets.all(kDefaultPadding / 2),
    decoration: cardDecoration,
    child: Slidable(
      enabled: slidable,
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
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
                    form.formName,
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
            for (var data in form.structure)
              if (data != null)
                Text(
                  data,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(color: Colors.grey),
                ),
            //     Text(
            //       "Sinan Kanidağlı",
            //       overflow: TextOverflow.ellipsis,
            //       style: GoogleFonts.montserrat(
            //           color: Colors.grey, fontWeight: FontWeight.w600),
            //     ),
            // Text(
            //   "SinanK0",
            //   overflow: TextOverflow.ellipsis,
            //   style: GoogleFonts.montserrat(color: Colors.grey),
            // ),
            // Text(
            //   "sinan_kanidagli@hotmail.com",
            //   overflow: TextOverflow.ellipsis,
            //   style: GoogleFonts.montserrat(color: Colors.grey),
            // ),
            // Text(
            //   "+90 536 491 42 79 ....",
            //   overflow: TextOverflow.ellipsis,
            //   style: GoogleFonts.montserrat(color: Colors.grey),
            // ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
          ],
        ),
      ),
    ),
  );
}
