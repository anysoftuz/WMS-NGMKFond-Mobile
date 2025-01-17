
import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';

class WPreviewButton extends StatelessWidget {
  const WPreviewButton({super.key, required this.onTap});
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          AppIcons.notes.svg(
            height: 24,
            width: 24,
            color: blue,
          ),
          const SizedBox(width: 8),
          const Text(
            "Превью",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: blue,
            ),
          )
        ],
      ),
    );
  }
}
