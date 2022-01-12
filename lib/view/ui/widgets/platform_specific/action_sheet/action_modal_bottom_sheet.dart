import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vonop/core/constants/view/view_constants.dart';
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/sheet_action.dart';

///Show platform specific modal bottom sheet with actions
///
///Cancel button is only available on IOS
void showPlatformSpecificModalBottomSheetWithActions(
  BuildContext context, {
  Widget? title,
  Widget? description,
  required List<SheetAction> actions,
  SheetAction? cancelButton,
}) {
  switch (Platform.operatingSystem) {
    case "ios":
      _cupertino(
        context,
        title: title,
        description: description,
        actions: actions,
        cancelButton: cancelButton,
      );
      break;
    case "android":
      _material(
        context,
        title: title,
        description: description,
        actions: actions,
      );
      break;
    default:
      break;
  }
}

void _cupertino(BuildContext context, {Widget? title, Widget? description, required List<SheetAction> actions, SheetAction? cancelButton}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: title,
        message: description,
        actions: actions.map((e) => CupertinoActionSheetAction(onPressed: e.onPressed, child: e.child)).toList(),
        cancelButton: cancelButton == null ? null : CupertinoActionSheetAction(onPressed: cancelButton.onPressed, child: cancelButton.child),
      );
    },
  );
}

void _material(BuildContext context, {Widget? title, Widget? description, required List<SheetAction> actions}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              const SizedBox(
                height: kDefaultPadding,
              ),
            if (title != null) title,
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            if (description != null) description,
            if (description != null)
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: actions
                        .map<Widget>((e) => InkWell(
                              onTap: e.onPressed,
                              child: Row(
                                children: [
                                  Padding(padding: const EdgeInsets.all(kDefaultPadding), child: e.child),
                                ],
                              ),
                            ))
                        .toList() +
                    [
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                    ],
              ),
            ),
          ],
        );
      });
}
