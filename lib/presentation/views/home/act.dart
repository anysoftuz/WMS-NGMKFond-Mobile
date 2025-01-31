import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/images.dart';

class ActDocument extends StatelessWidget {
  const ActDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo and title
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

                  // Document header
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
                  const SizedBox(height: 20),

                  // Document description
                  const Text(
                    'На основании данного документа мы подтверждаем, что следующая продукция принята в соответствии с правилами приемки продукции по количеству и качеству.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // Products sections
                  _buildProductExpansionTile('Продукт 1', {
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
                  }),
                  _buildProductExpansionTile('Продукт 2', {}),
                  _buildProductExpansionTile('Продукт 3', {}),

                  const SizedBox(height: 20),

                  // Signatures
                  _buildSignatureRow('Кладовщик:', 'Эргашева Л.'),
                  _buildSignatureRow('Товаровед:', 'Жалилов М.'),
                  _buildSignatureRow('Экспедитор:', 'Акромов О.'),
                  _buildSignatureRow('Зав. склад', 'Каххоров А.'),
                  _buildSignatureRow('Начальник базы', 'Маликов Б.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductExpansionTile(String title, Map<String, String> details) {
    return SizedBox(
      height: 18,
      child: ExpansionTile(
        minTileHeight: 18,
        tilePadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: details.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          entry.value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureRow(String title, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
