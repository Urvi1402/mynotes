import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            fontSize: 15,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
          ),
        ),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              optionTitle,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}
