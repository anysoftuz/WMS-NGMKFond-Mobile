import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_tabbar.dart';

class MeatWarehouseView extends StatelessWidget {
  const MeatWarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TitileFilter(text: 'Мясной склад'),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WTabBar(
              tabs: [
                Text('По продуктам'),
                Text('По накладным'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: bg00),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Заполнение склада',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '86.5%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: const LinearProgressIndicator(
                              color: green,
                              backgroundColor: bg00,
                              minHeight: 16,
                              value: 86.5 / 100,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Этот элемент показывает процент заполненности склада, помогая вам следить за остатками и эффективно управлять запасами.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: secondary500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      8,
                      (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: InformationIteam(
                          isButton: false,
                          mainTitle: 'Говядина',
                          title1: 'Количество:',
                          subtitle1: '85.0',
                          title2: 'Ед. измерения:',
                          subtitle2: 'кг',
                          title3: 'Сумма:',
                          subtitle3: '6 400 000 UZS',
                        ),
                      ),
                    ),
                    const PaginationIndexIteam(length: 8),
                    const SizedBox(height: 12),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: bg00),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Заполнение склада',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '20.5%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: const LinearProgressIndicator(
                              color: red,
                              backgroundColor: bg00,
                              minHeight: 16,
                              value: 20.5 / 100,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Этот элемент показывает процент заполненности склада, помогая вам следить за остатками и эффективно управлять запасами.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: secondary500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      8,
                      (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: InformationIteam(
                          isButton: false,
                          mainTitle: 'Говядина',
                          title1: '№ накладной:',
                          subtitle1: 'NK-00000',
                          title2: 'Дата накладной:',
                          subtitle2: '23.08.2024',
                          title3: 'Количество:',
                          subtitle3: '85.0',
                          title4: 'Ед. измерения:',
                          subtitle4: 'кг',
                          title5: 'Цена:',
                          subtitle5: '80 000 UZS',
                          title6: 'Сумма:',
                          subtitle6: '6 400 000 UZS',
                        ),
                      ),
                    ),
                    const PaginationIndexIteam(length: 8),
                    const SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaginationIndexIteam extends StatefulWidget {
  const PaginationIndexIteam({super.key, required this.length});
  final int length;

  @override
  State<PaginationIndexIteam> createState() => _PaginationIndexIteamState();
}

class _PaginationIndexIteamState extends State<PaginationIndexIteam> {
  ValueNotifier valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WButton(
          height: 48,
          width: 48,
          onTap: () {
            if (valueNotifier.value != 0) {
              valueNotifier.value -= 1;
            }
          },
          color: whiteGrey,
          child: AppIcons.chevronLeft.svg(),
        ),
        const SizedBox(width: 4),
        ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, __) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 260,
                maxHeight: 48,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => WButton(
                  height: 48,
                  width: 48,
                  onTap: () {
                    valueNotifier.value = index;
                  },
                  color: value == index ? null : whiteGrey,
                  textColor: value == index ? white : backgroundText,
                  text: '${index + 1}',
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemCount: widget.length,
              ),
            );
          },
        ),
        const SizedBox(width: 4),
        WButton(
          height: 48,
          width: 48,
          onTap: () {
            if (valueNotifier.value < widget.length) {
              valueNotifier.value += 1;
            }
          },
          color: whiteGrey,
          child: AppIcons.chevronRight.svg(),
        ),
      ],
    );
  }
}
