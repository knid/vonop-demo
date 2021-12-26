import 'package:flutter/material.dart';

class SheetAction {
  final Widget child;
  final VoidCallback onPressed;

  SheetAction(this.child, this.onPressed);
}
