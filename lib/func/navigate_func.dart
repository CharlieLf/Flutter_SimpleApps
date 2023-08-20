import 'package:flutter/material.dart';

void navigateWithoutBackButton(
    BuildContext context, String navigateContext, Widget page) {
  showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: const Text("Success"),
        content: Text(navigateContext),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: ((context) => page)),
              );
            },
            child: const Text("Direct"),
          ),
        ],
      );
    }),
  );
}
