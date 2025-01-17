import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class TitileFilter extends StatelessWidget {
  const TitileFilter({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 12),
        WButton(
          onTap: () {
            context.push(AppRouteName.filter);
          },
          height: 52,
          width: 52,
          borderRadius: 20,
          color: whiteGrey,
          child: AppIcons.frame.svg(),
        ),
      ],
    );
  }
}
