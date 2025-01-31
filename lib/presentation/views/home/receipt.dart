import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/data/models/overhead_model.dart';
import 'package:sklad/utils/my_function.dart';

class ReceiptPreview extends StatelessWidget {
  const ReceiptPreview({
    super.key,
    required this.document,
    required this.fromUser,
    required this.toUser,
    required this.freight,
    required this.warehouseManager,
    required this.managerBase,
  });
  final DocumentModel document;
  final String fromUser;
  final String toUser;
  final String freight;
  final String warehouseManager;
  final String managerBase;

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
                  _buildDetailRow(
                      'Дата создания в системе:', document.document.date),
                  _buildDetailRow('№ накладной в системе:', 'NK-00000'),
                  _buildDetailRow('Дата накладной:', document.document.date),
                  _buildDetailRow('№ накладной:', document.document.number),
                  _buildDetailRow('Вид документа:', 'Накладные'),
                  _buildDetailRow('От кого:', fromUser),
                  _buildDetailRow('Кому:', toUser),
                  _buildDetailRow('Через кого:', document.document.throughWhom),
                  _buildDetailRow('Основание:', document.document.basis),
                  _buildDetailRow(
                    'Способ отправления:',
                    document.document.shippingMethod,
                  ),

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
                              ...List.generate(
                                document.document.products.length,
                                (index) => _buildTableRow(
                                  index,
                                  document.document.products[index].name ??
                                      "Nomalum",
                                  document.document.products[index].quantity,
                                  document.document.products[index].unit,
                                  MyFunction.priceFormat(
                                      document.document.products[index].price),
                                  MyFunction.priceFormat(
                                    document.document.products[index].price *
                                        (int.tryParse(document.document
                                                .products[index].quantity) ??
                                            1),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 12,
                            children: [
                              const Text(
                                'Общая сумма: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 7.19,
                                  color: backgroundText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  7.19,
                                  8.21,
                                  7.19,
                                ),
                                child: Text(
                                  '${MyFunction.priceFormat(
                                    MyFunction.allList(
                                      document.document.products
                                          .map(
                                            (e) =>
                                                e.price *
                                                (int.tryParse(e.quantity) ?? 1),
                                          )
                                          .toList(),
                                    ),
                                  )} сум',
                                  style: const TextStyle(
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
                        text: TextSpan(
                          text: "№: ",
                          style: const TextStyle(
                            color: backgroundText,
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: document.act.number,
                              style: const TextStyle(
                                color: secondary500,
                                fontSize: 10.27,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Дата: ",
                          style: const TextStyle(
                            color: backgroundText,
                            fontSize: 10.27,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: document.document.date,
                              style: const TextStyle(
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
                  if (document.act.content.isNotEmpty)
                    const SizedBox(height: 12),
                  if (document.act.content.isNotEmpty)
                    Text(
                      document.act.content,
                      style: const TextStyle(
                        fontSize: 6.75,
                        fontWeight: FontWeight.w400,
                        color: backgroundText,
                      ),
                    ),
                  const SizedBox(height: 12),
                  ...List.generate(
                    document.act.products.length,
                    (index) => _buildProductExpansionTile(
                      'Продукт ${index + 1}',
                      {
                        'Название продукта':
                            document.document.products[index].name ?? "nomalum",
                        'Количество продукта':
                            document.act.products[index].quantity,
                        'Единица измерения': document.act.products[index].unit,
                        'Номер и дата договора о поставке':
                            document.act.products[index].contractDetails,
                        'Номер и дата накладной': '№ 365 26.08.2024',
                        'Производитель продукта':
                            document.act.products[index].manufacturer,
                        'Поставщик': fromUser,
                        'Получатель': toUser,
                        'Транспорт':
                            document.act.products[index].shippingMethod,
                        'Номер и дата лицензии':
                            '${document.act.products[index].licence} от ${document.act.products[index].licenceDate}',
                        'Номер и дата заключение\nСанитарно-эпидемиологического центра':
                            '${document.act.products[index].sanitary} от ${document.act.products[index].sanitaryDate} ',
                        'Номер и дата удостоверения ветеринарии':
                            '${document.act.products[index].vetirinary}  от ${document.act.products[index].vetirinaryDate} ',
                        'Номер и дата удостоверения качества':
                            '${document.act.products[index].quality}  от ${document.act.products[index].qualityDate} ',
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // _buildSignatureRow('Кладовщик:', 'Эргашева Л.'),
                  _buildSignatureRow('Товаровед:', freight),
                  // _buildSignatureRow('Экспедитор:', 'Акромов О.'),
                  _buildSignatureRow('Зав. склад', warehouseManager),
                  _buildSignatureRow('Начальник базы', managerBase),
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
    int index,
    String name,
    String quantity,
    String unit,
    String price,
    String total,
  ) {
    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? null : whiteGrey,
        border: const Border(bottom: BorderSide(color: bg00)),
      ),
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
