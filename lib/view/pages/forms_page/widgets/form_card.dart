import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vonop/core/init/provider/form/form_provider.dart';
import 'package:vonop/models/form/form.dart' as model;

import 'package:provider/provider.dart';
import '../../../ui/styles/card_decoration.dart';
import '../../../../core/constants/view/view_constants.dart';

Widget formCard(BuildContext context, {required model.Form form, required int index, bool slidable = true}) {
  return Container(
    margin: const EdgeInsets.all(kDefaultPadding / 2),
    decoration: cardDecoration,
    child: Slidable(
      enabled: slidable,
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            if (form.formId != null) {
              context.read<FormProvider>().delete(form.formId!);
            }
          },
          // confirmDismiss: () async {
          //   return showDialog<bool>(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog();
          //     },
          //   ).then((value) => value ?? false);
          // },
        ),
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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
          ],
        ),
      ),
    ),
  );
}
