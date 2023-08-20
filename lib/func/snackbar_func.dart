import 'package:flutter/material.dart';

void showSnackBar(BuildContext context ,String error) {
    SnackBar snackBar = SnackBar(
      content: Text(error),
      duration: const Duration(milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }