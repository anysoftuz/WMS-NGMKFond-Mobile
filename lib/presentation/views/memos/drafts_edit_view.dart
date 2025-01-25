import 'package:flutter/material.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/bottom_info_button.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_preview_button.dart';

class DraftsEditView extends StatelessWidget {
  const DraftsEditView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      bottomNavigationBar: BottomInfoButton(
        onTap1: () {},
        onTap2: () {},
        isLoading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              title: 'Название документа',
              hintText: 'Служебная записка',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: '№ документа',
                    hintText: 'Введите',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: 'Дата создания документа',
                    hintText: '27.11.2024',
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Кому',
              hintText: 'Выберите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Тема',
              hintText: 'О получении товара',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Сообщения',
              hintText: 'Отображение сообщения служебки',
              minLines: 5,
              maxLines: 5,
              noHeight: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Отправитель',
              hintText: 'Эргашева Л.',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            WPreviewButton(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
