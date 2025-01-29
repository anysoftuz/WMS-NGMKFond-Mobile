
import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';

class EmptyIteam extends StatelessWidget {
  const EmptyIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons.empty.svg(),
          const Text(
            'Нет информации',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: secondary500,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
