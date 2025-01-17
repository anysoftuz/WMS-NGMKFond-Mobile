import 'package:flutter/material.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';

class OutgoingView extends StatefulWidget {
  const OutgoingView({super.key});

  @override
  State<OutgoingView> createState() => _OutgoingViewState();
}

class _OutgoingViewState extends State<OutgoingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TitileFilter(text: 'Исходящие'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const InformationIteam(
                  mainTitle: "№ документа: 04-04-01/463",
                  title1: 'Дата:',
                  subtitle1: '23.08.2024',
                  title2: 'Тема:',
                  subtitle2: 'Доставка мяса',
                  title3: 'Отправитель:',
                  subtitle3: 'Зарафшан',
                  title4: 'Получатель:',
                  subtitle4: 'Фонд',
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
