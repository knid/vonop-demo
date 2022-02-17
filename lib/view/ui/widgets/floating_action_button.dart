import 'package:flutter/material.dart';
import '../../pages/scanner.dart';

import '../../../core/constants/view/view_constants.dart';

dynamic floatingActionButton(BuildContext context) => MediaQuery.of(context).viewInsets == EdgeInsets.zero
    ? Container(
        decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(50), boxShadow: const [
          BoxShadow(offset: Offset(0, 5), color: kPrimaryColor, blurRadius: 10),
        ]),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            debugPrint(MediaQuery.of(context).viewInsets.toString());
            debugPrint('pressed');
            Navigator.push(context, MaterialPageRoute(builder: (context) => const QRViewExample()));
          },
          tooltip: 'QR Okut',
          child: const Icon(Icons.qr_code_scanner),
        ),
      )
    : null;
