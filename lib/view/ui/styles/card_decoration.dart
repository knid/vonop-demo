import 'package:flutter/material.dart';

final BoxDecoration cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      offset: const Offset(0, 10),
      blurRadius: 20,
    ),
  ],
);
