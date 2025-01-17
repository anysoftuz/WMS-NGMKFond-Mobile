import 'package:flutter/material.dart';
import 'package:sklad/presentation/views/warehouse_bases/meat_warehouse_view.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';

class OverheadOutgoingView extends StatelessWidget {
  const OverheadOutgoingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SafeArea(
        child: PaginationIndexIteam(length: 8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TitileFilter(text: 'Исходящие нак.'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const InformationIteam(
                  mainTitle: "№ накладной в системе: NK-00000",
                  title1: 'Дата:',
                  subtitle1: '23.08.2024',
                  title2: 'Основание:',
                  subtitle2: 'Назначение №2392',
                  title3: 'От кого:',
                  subtitle3: 'Зарафшан',
                  title4: 'Кому:',
                  subtitle4: 'Фонд',
                  title5: 'Способ отправления:',
                  subtitle5: '85 897 VAA',
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
