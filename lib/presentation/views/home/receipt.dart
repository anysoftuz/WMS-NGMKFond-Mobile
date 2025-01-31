import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';

class ReceiptPreview extends StatelessWidget {
  const ReceiptPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Превью')),
      backgroundColor: whiteGrey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 56),
        child: Column(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo and header
                  Center(
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          spacing: 6.16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImages.logo.imgAsset(height: 20.54),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NKMK",
                                  style: TextStyle(
                                    fontSize: 9.24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000D24),
                                  ),
                                ),
                                Text(
                                  'Jamg‘armasi',
                                  style: TextStyle(
                                    fontSize: 6.16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFCBCCCE),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          'НАКЛАДНОЙ',
                          style: TextStyle(
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000D24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Receipt details
                  _buildDetailRow('Дата создания в системе:', '24.08.2024'),
                  _buildDetailRow('№ накладной в системе:', 'NK-00000'),
                  _buildDetailRow('Дата накладной:', '24.08.2024'),
                  _buildDetailRow('№ накладной:', '247'),
                  _buildDetailRow('Вид документа:', 'Входящий накладной'),
                  _buildDetailRow('От кого:',
                      'Руководитель группы отдела координации общественного питания'),
                  _buildDetailRow('Кому:',
                      '«Фонд НКМК» ДМ «Навоийской» областной администрации, руководитель комплекса общественного питания Баракаеву Д.'),
                  _buildDetailRow('Через кого:',
                      '«Фонд НКМК» ДМ «Навоийской» областной администрации, руководитель комплекса общественного питания Баракаеву Д.'),
                  _buildDetailRow('Основание:', 'Назначение №2392'),
                  _buildDetailRow('Способ отправления:', '85 897 VAA'),

                  const SizedBox(height: 20),

                  // Table
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.22),
                      border: Border.all(color: bg00),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.22),
                      child: Column(
                        children: [
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1.5), // Название
                              1: FlexColumnWidth(1), // Количество
                              2: FlexColumnWidth(1), // Ед. измерения
                              3: FlexColumnWidth(1.5), // Цена
                              4: FlexColumnWidth(1.5), // Сумма - кенгроқ
                            },
                            children: [
                              _buildTableHeader(),
                              _buildTableRow(
                                'Картофель',
                                '80',
                                'кг',
                                '22 000',
                                '1 760 000',
                              ),
                              _buildTableRow(
                                'Говядина',
                                '30',
                                'кг',
                                '86 000',
                                '2 580 000',
                              ),
                              _buildTableRow(
                                'Горох',
                                '50',
                                'кг',
                                '34 000',
                                '1 700 000',
                              ),
                              _buildTableRow(
                                'Морковь',
                                '50',
                                'кг',
                                '20 000',
                                '1 000 000',
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 12,
                            children: [
                              Text(
                                'Общая сумма: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 7.19,
                                  color: backgroundText,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0, 7.19, 8.21, 7.19),
                                child: Text(
                                  '7 040 000 сум',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 7.19,
                                    color: backgroundText,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo and header
                  Center(
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          spacing: 6.16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImages.logo.imgAsset(height: 20.54),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NKMK",
                                  style: TextStyle(
                                    fontSize: 9.24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000D24),
                                  ),
                                ),
                                Text(
                                  'Jamg‘armasi',
                                  style: TextStyle(
                                    fontSize: 6.16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFCBCCCE),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          'АКТ',
                          style: TextStyle(
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000D24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "№:",
                          style: TextStyle(
                            color: backgroundText,
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: ' 04-04-01/463',
                              style: TextStyle(
                                color: secondary500,
                                fontSize: 10.27,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Дата:",
                          style: TextStyle(
                            color: backgroundText,
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: ' 24.08.2024',
                              style: TextStyle(
                                color: secondary500,
                                fontSize: 10.27,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'На основании данного документа мы подтверждаем, что следующая продукция принята в соответствии с правилами приемки продукции по количеству и качеству.',
                    style: TextStyle(
                      fontSize: 6.75,
                      fontWeight: FontWeight.w400,
                      color: backgroundText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildProductExpansionTile(
                    'Продукт 1',
                    {
                      'Название продукта': 'Картофель',
                      'Количество продукта': '265',
                      'Единица измерения': 'кг',
                      'Номер и дата договора о поставке':
                          'К1029745 от 25.07.2024',
                      'Номер и дата накладной': '№ 365 26.08.2024',
                      'Производитель продукта': 'ООО "Brend"',
                      'Поставщик': 'ООО "Yuksalish"',
                      'Получатель': 'РУ "Зарафшан"',
                      'Транспорт': '85 085 RRR',
                      'Номер и дата лицензии': '№ L-86978576 от 05.02.2022',
                      'Номер и дата заключение\nСанитарно-эпидемиологического центра':
                          '№ SM-069788 от 05.01.2024',
                      'Номер и дата удостоверения ветеринарии':
                          '№ ВТ-0365 от 10.01.2024',
                      'Номер и дата удостоверения качества':
                          '№ УК-0614 от 07.02.2024',
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildSignatureRow('Кладовщик:', 'Эргашева Л.'),
                  _buildSignatureRow('Товаровед:', 'Жалилов М.'),
                  _buildSignatureRow('Экспедитор:', 'Акромов О.'),
                  _buildSignatureRow('Зав. склад', 'Каххоров А.'),
                  _buildSignatureRow('Начальник\nбазы', 'Маликов Б.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignatureRow(String title, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 6.75,
              color: backgroundText,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 6.75,
              color: secondary500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: "$label ",
          style: const TextStyle(
            color: backgroundText,
            fontSize: 10.27,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                color: secondary500,
                fontSize: 10.27,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return const TableRow(
      decoration: BoxDecoration(color: whiteGrey),
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.21, 7.19, 0, 7.19),
            child: Text(
              'Название',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              'Количество',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              'Ед. измерения',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              'Цена',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 7.19, 8.21, 7.19),
            child: Text(
              'Сумма',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductExpansionTile(String title, Map<String, String> details) {
    return ExpansionTile(
      minTileHeight: 18,
      tilePadding: const EdgeInsets.symmetric(horizontal: 7.72),
      trailing: AppIcons.chevronDown.svg(
        height: 10,
        width: 10,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 6.75,
          color: backgroundText,
        ),
      ),
      children: [
        Table(
          border: TableBorder.all(
            color: bg00,
            borderRadius: BorderRadius.circular(4),
          ),
          children: details.entries.map(
            (entry) {
              return TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(7.72, 5.79, 7.72, 5.79),
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 7.19,
                        color: backgroundText,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(7.72, 5.79, 7.72, 5.79),
                    child: Text(
                      entry.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 7.19,
                        color: secondary500,
                      ),
                    ),
                  ),
                ),
              ]);
            },
          ).toList(),
        )
      ],
    );
  }

  TableRow _buildTableRow(
    String name,
    String quantity,
    String unit,
    String price,
    String total,
  ) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.21, 7.19, 0, 7.19),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              quantity,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              unit,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.19),
            child: Text(
              '$price сум',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 7.19, 8.21, 7.19),
            child: Text(
              '$total сум',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 7.19,
                color: backgroundText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
