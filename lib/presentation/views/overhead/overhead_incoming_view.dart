import 'package:flutter/material.dart';
import 'package:sklad/presentation/views/warehouse_bases/meat_warehouse_view.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';

class OverheadIncomingView extends StatelessWidget {
  const OverheadIncomingView({super.key});

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
            const TitileFilter(text: 'Входящие нак.'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const InformationIteam(
                  mainTitle: "№ накладной в системе: NK-00000",
                  title1: 'Дата:',
                  subtitle1: '23.08.2024',
                  title2: '№ документа:',
                  subtitle2: '247',
                  title3: 'Дата накладной:',
                  subtitle3: '23.08.2024',
                  title4: 'Основание:',
                  subtitle4: 'Назначение №2392',
                  title5: 'От кого:',
                  subtitle5: 'Зарафшан',
                  title6: 'Кому:',
                  subtitle6: 'Фонд',
                  title7: 'Способ отправления:',
                  subtitle7: '85 897 VAA',
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
