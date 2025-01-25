import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 42)),
        onPressed: onClicked,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.more_time, size: 28),
            SizedBox(width: 8),
            Text(
              'Show Picker',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
}
