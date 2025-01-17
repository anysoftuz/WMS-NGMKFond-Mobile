import 'package:flutter/material.dart';
import 'package:sklad/presentation/views/memos/drafts_edit_view.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';

class MemosDraftsView extends StatelessWidget {
  const MemosDraftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TitileFilter(text: 'Черновики'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => InformationIteam(
                  isEdit: true,
                  onTapEdit: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: (context) => const DraftsEditView(),
                    ));
                  },
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
