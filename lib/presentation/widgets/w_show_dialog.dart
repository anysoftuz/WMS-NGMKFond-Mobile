import 'package:flutter/material.dart';

Future<T?> wshowDialog<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    ),
  );
}
