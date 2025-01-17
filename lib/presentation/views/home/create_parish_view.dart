import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/bottom_info_button.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_preview_button.dart';

class CreateParishView extends StatelessWidget {
  const CreateParishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Служебная записка")),
      bottomNavigationBar: const BottomInfoButton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              title: 'Название документа',
              hintText: 'Входящий накладной',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Дата создания документа',
              hintText: '27.11.2024',
              prefixIcon: AppIcons.calendarMinus.svg(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: '№ накладной в системе',
              hintText: 'Автоматически',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: '№ накладной',
                    hintText: 'Введите',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: 'Дата создания документа',
                    hintText: 'дд.мм.гггг',
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'От кого',
              hintText: 'Выберите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Кому',
              hintText: 'DISABLE',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Через кого',
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Основание',
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Способ отправления',
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteGrey,
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    title: const Text(
                      "Таблица получаемых продуктов",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: [
                            CustomTextField(
                              title: 'Способ отправления',
                              hintText: 'Введите',
                              fillColor: white,
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 12),
                            CustomTextField(
                              title: 'Вид продукта',
                              hintText: 'Выберите',
                              fillColor: white,
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    title: 'Цена',
                                    hintText: 'Выберите',
                                    fillColor: white,
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CustomTextField(
                                    title: 'Цена',
                                    hintText: 'Выберите',
                                    fillColor: white,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            CustomTextField(
                              title: 'Цена',
                              hintText: 'Выберите',
                              fillColor: white,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(height: 1),
                  ),
                  WButton(
                    onTap: () {},
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    borderRadius: 8,
                    border: Border.all(color: blue),
                    color: Colors.transparent,
                    textColor: blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.squarePlus.svg(color: blue),
                        const SizedBox(width: 12),
                        const Text("Добавить")
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            WPreviewButton(
              onTap: () {},
            ),
            const Divider(height: 32),
            CustomTextField(
              title: 'АКТ',
              hintText: 'АКТ',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: '№ накладной в системе',
              hintText: 'Автоматически',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: '№ Акта',
              hintText: 'Введите',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Содержание акта',
              hintText: 'Отображение сообщения служебки',
              minLines: 5,
              maxLines: 5,
              noHeight: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            WPreviewButton(
              onTap: () {},
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Состав комиссии приема продуктов",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Кладовщик',
                    hintText: 'Введите',
                    fillColor: white,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Товаровед',
                    hintText: 'Введите',
                    fillColor: white,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Экспедитор',
                    hintText: 'Введите',
                    fillColor: white,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Зав. склад',
                    hintText: 'Введите',
                    fillColor: white,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Начальник базы',
                    hintText: 'Введите',
                    fillColor: white,
                    onChanged: (value) {},
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
