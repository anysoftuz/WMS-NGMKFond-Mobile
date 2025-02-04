import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/data/models/document_show_model.dart';
import 'package:sklad/presentation/widgets/w_shimmer.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';

class PdfGenView extends StatefulWidget {
  const PdfGenView({
    super.key,
    required this.document,
    this.isMemos = false,
  });
  final Document document;
  final bool isMemos;

  @override
  State<PdfGenView> createState() => _PdfGenViewState();
}

class _PdfGenViewState extends State<PdfGenView> {
  DocumentShowModel? documentShowModel;

  @override
  void initState() {
    context.read<HomeBloc>().add(GetDocumentShowEvent(
          id: widget.document.id,
          onSucces: (model) {
            documentShowModel = model;
            setState(() {});
          },
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document.number)),
      backgroundColor: whiteGrey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 56),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.statusShow.isInProgress) {
              return const WShimmer(
                height: 220,
                width: double.infinity,
              );
            }
            return Container(
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
                        Text(
                          widget.isMemos ? 'СЛУЖЕБНАЯ ЗАПИСКА' : 'ЗАПРОС',
                          style: const TextStyle(
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
                    documentShowModel?.document.date ?? '',
                  ),
                  _buildDetailRow(
                    '№: ',
                    documentShowModel?.document.number ?? '',
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    widget.isMemos ? 'Кому:' : 'Получатель: ',
                    documentShowModel?.document.toName ?? '',
                  ),
                  if (!widget.isMemos) ...[
                    const SizedBox(height: 12),
                    _buildDetailRow('Тип запроса: ', 'Свободный запрос'),
                  ],
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    'Тема: ',
                    documentShowModel?.document.subject ?? '',
                  ),
                  if (documentShowModel?.document.content != null)
                    const SizedBox(height: 12),
                  if (documentShowModel?.document.content != null)
                    Text(
                      documentShowModel?.document.content ?? '',
                      style: const TextStyle(
                        fontSize: 6.75,
                        fontWeight: FontWeight.w400,
                        color: backgroundText,
                      ),
                    ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    '${documentShowModel?.document.fromRoleTitle ?? "Nomalum"}: ',
                    documentShowModel?.document.fromName ?? '',
                  ),
                ],
              ),
            );
          },
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
