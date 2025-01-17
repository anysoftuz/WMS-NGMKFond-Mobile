import 'package:flutter/material.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';

class IncomingView extends StatefulWidget {
  const IncomingView({super.key});

  @override
  State<IncomingView> createState() => _IncomingViewState();
}

class _IncomingViewState extends State<IncomingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TitileFilter(text: 'Входящие'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const InformationIteam(
                  mainTitle: "№ документа: 04-04-01/463",
                  title1: 'Дата:',
                  subtitle1: '23.08.2024',
                  title2: 'Тема:',
                  subtitle2: 'Доставка мяса из одного основного...',
                  title3: 'Отправитель:',
                  subtitle3: 'Зарафшан dfeededede fefefefefefe...',
                  title4: 'Получатель:',
                  subtitle4: 'Головное управление, по управлению...',
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
