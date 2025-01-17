import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Фильтр"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Сбросить",
              style: TextStyle(color: red),
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          onTap: () {
            Navigator.pop(context);
          },
          text: 'Применить',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: "с этой даты",
                    hintText: 'дд.мм.гггг',
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: "по эту дату",
                    hintText: 'дд.мм.гггг',
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Номер документа",
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Тема",
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Кому",
              hintText: 'Выберите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Отправитель",
              hintText: 'Выберите',
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
