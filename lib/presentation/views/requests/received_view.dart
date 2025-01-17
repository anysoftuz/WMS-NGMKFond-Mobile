import 'package:flutter/material.dart';
import 'package:sklad/presentation/views/warehouse_bases/meat_warehouse_view.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_tabbar.dart';

class ReceivedView extends StatelessWidget {
  const ReceivedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TitileFilter(text: 'Исходящие запросы'),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: WTabBar(
                tabs: [
                  Text('Свободный'),
                  Text('Месячный'),
                  Text('Годовой'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      ...List.generate(
                        8,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: InformationIteam(
                            mainTitle: "№ запроса: Z-45896",
                            title1: 'Дата:',
                            subtitle1: '23.08.2024',
                            title2: 'Тема:',
                            subtitle2: 'Доставка мяса',
                            title3: 'Отправитель:',
                            subtitle3: 'Зарафшан',
                            title4: 'Тип запроса:',
                            subtitle4: 'Полученные',
                          ),
                        ),
                      ),
                      const PaginationIndexIteam(length: 8),
                      const SizedBox(height: 12),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      ...List.generate(
                        8,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: InformationIteam(
                            mainTitle: "№ запроса: Z-45896",
                            title1: 'Дата:',
                            subtitle1: '23.08.2024',
                            title2: 'Тема:',
                            subtitle2: 'Доставка мяса',
                            title3: 'Отправитель:',
                            subtitle3: 'Зарафшан',
                            title4: 'Тип запроса:',
                            subtitle4: 'Полученные',
                          ),
                        ),
                      ),
                      const PaginationIndexIteam(length: 8),
                      const SizedBox(height: 12),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      ...List.generate(
                        8,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: InformationIteam(
                            mainTitle: "№ запроса: Z-45896",
                            title1: 'Дата:',
                            subtitle1: '23.08.2024',
                            title2: 'Тема:',
                            subtitle2: 'Доставка мяса',
                            title3: 'Отправитель:',
                            subtitle3: 'Зарафшан',
                            title4: 'Тип запроса:',
                            subtitle4: 'Полученные',
                          ),
                        ),
                      ),
                      const PaginationIndexIteam(length: 8),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
