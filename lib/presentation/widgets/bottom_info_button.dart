import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_show_dialog.dart';

class BottomInfoButton extends StatelessWidget {
  const BottomInfoButton({
    super.key,
    required this.onTap1,
    required this.onTap2,
    required this.isLoading,
  });
  final Function() onTap1;
  final Function() onTap2;
  final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      wshowDialog(
                        context: context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Вы уверены что хотите отменить?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Все не сохраненные изменения будут потеряны',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: secondary500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  text: 'Остаться',
                                  color: bg00,
                                  textColor: backgroundText,
                                ),
                                const SizedBox(width: 16),
                                WButton(
                                  onTap: () {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
                                  },
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  text: 'Отменить',
                                  color: red,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    text: 'Отменить',
                    color: bg00,
                    textColor: backgroundText,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: onTap1,
                    isLoading: isLoading,
                    text: 'Отправить',
                    color: green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: onTap2,
              isLoading: isLoading,
              text: 'Сохранить как черновик',
            )
          ],
        ),
      ),
    );
  }
}
