import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class InformationIteam extends StatelessWidget {
  const InformationIteam({
    super.key,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
    required this.title3,
    required this.subtitle3,
    this.title4,
    this.subtitle4,
    this.title5,
    this.subtitle5,
    this.title6,
    this.subtitle6,
    this.isButton = true,
    this.isEdit = false,
    required this.mainTitle,
    this.onTapEdit,
    this.title7,
    this.subtitle7,
  });

  final String mainTitle;
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;
  final String title3;
  final String subtitle3;
  final String? title4;
  final String? subtitle4;
  final String? title5;
  final String? subtitle5;
  final String? title6;
  final String? subtitle6;
  final String? title7;
  final String? subtitle7;
  final bool isButton;
  final bool isEdit;
  final GestureTapCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: whiteGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: backgroundText,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: backgroundText,
                      ),
                    ),
                    Text(
                      subtitle1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondary500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: backgroundText,
                      ),
                    ),
                    Text(
                      subtitle2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondary500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title3,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: backgroundText,
                      ),
                    ),
                    Text(
                      subtitle3,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondary500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (subtitle4 != null && title4 != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title4 ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: backgroundText,
                        ),
                      ),
                      Text(
                        subtitle4 ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: secondary500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (title5 != null && subtitle5 != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title5 ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: backgroundText,
                          ),
                        ),
                        Text(
                          subtitle5 ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: secondary500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (subtitle6 != null && title6 != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title6 ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: backgroundText,
                            ),
                          ),
                          Text(
                            subtitle6 ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: secondary500,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          if (title7 != null && subtitle7 != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title7 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: backgroundText,
                    ),
                  ),
                  Text(
                    subtitle7 ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondary500,
                    ),
                  ),
                ],
              ),
            ),
          if (isButton) ...[
            const SizedBox(height: 20),
            if (isEdit)
              WButton(
                onTap: () {
                  if (onTapEdit != null) {
                    onTapEdit!();
                  }
                },
                height: 40,
                borderRadius: 12,
                color: Colors.transparent,
                textColor: backgroundText,
                border: Border.all(color: bg00),
                text: 'Редактировать',
              )
            else
              WButton(
                onTap: () {
                  context.push(AppRouteName.pdfInfo);
                },
                height: 40,
                borderRadius: 12,
                color: bg00,
                textColor: backgroundText,
                text: 'Посмотреть',
              )
          ]
        ],
      ),
    );
  }
}
