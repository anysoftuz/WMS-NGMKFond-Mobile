import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/utils/my_function.dart';

class PdfGenView extends StatelessWidget {
  const PdfGenView({
    super.key,
    required this.komu,
    required this.tema,
    required this.docNum,
    required this.note,
  });
  final String komu;
  final String tema;
  final String docNum;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Превью')),
      backgroundColor: whiteGrey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 56),
        child: Container(
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
                      'ЗАПРОС',
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
              _buildDetailRow(
                'Дата: ',
                MyFunction.dateFormatDate(DateTime.now().toString()),
              ),
              _buildDetailRow('№: ', docNum),
              const SizedBox(height: 12),
              _buildDetailRow('Получатель: ', komu),
              const SizedBox(height: 12),
              _buildDetailRow('Тип запроса: ', 'Свободный запрос'),
              const SizedBox(height: 12),
              _buildDetailRow('Тема: ', tema),
              if (note.isNotEmpty) const SizedBox(height: 12),
              if (note.isNotEmpty)
                Text(
                  note,
                  style: const TextStyle(
                    fontSize: 6.75,
                    fontWeight: FontWeight.w400,
                    color: backgroundText,
                  ),
                ),
              const SizedBox(height: 12),
              _buildDetailRow(
                'Отправитель: ',
                '${context.read<AuthBloc>().state.userModel.user?.firstname} ${context.read<AuthBloc>().state.userModel.user?.lastname}',
              ),
            ],
          ),
        ),
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
}
