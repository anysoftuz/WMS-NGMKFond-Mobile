import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/data/models/filter_model.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/views/memos/drafts_edit_view.dart';
import 'package:sklad/presentation/widgets/empty_iteam.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_shimmer.dart';
import 'package:sklad/utils/my_function.dart';

class MemosDraftsView extends StatefulWidget {
  const MemosDraftsView({super.key});

  @override
  State<MemosDraftsView> createState() => _MemosDraftsViewState();
}

class _MemosDraftsViewState extends State<MemosDraftsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TitileFilter(
              text: 'Черновики',
              onFilter: (
                controllerNumber,
                controllerTema,
                controllerKomu,
                controllerOtp,
                controllerDate1,
                controllerDate2,
              ) {
                context.read<HomeBloc>().add(GetDraftsEvent(
                      model: FilterModel(
                        docType: 'memo',
                        number: controllerNumber.text,
                        subject: controllerOtp.text,
                      ),
                    ));
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.statusDraftsMemo.isInProgress) {
                    return ListView.separated(
                      itemBuilder: (context, index) => const WShimmer(
                        height: 220,
                        width: double.infinity,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: 12,
                    );
                  }
                  if (state.draftsMemoModel.documents.isEmpty) {
                    return const EmptyIteam();
                  }
                  return RefreshIndicator.adaptive(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(GetDraftsEvent(
                            model: FilterModel(docType: 'memo'),
                          ));
                      await Future.delayed(Duration.zero);
                    },
                    child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.push(AppRouteName.pdfView, extra: {
                            'title':
                                state.draftsMemoModel.documents[index].number,
                            'id': state.draftsMemoModel.documents[index].id,
                          });
                        },
                        child: InformationIteam(
                          isEdit: true,
                          onTapEdit: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => DraftsEditView(
                                  document:
                                      state.draftsMemoModel.documents[index],
                                ),
                              ),
                            );

                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     backgroundColor: white,
                            //     content: const Text(
                            //       'Редактирование данного типа запроса недоступно в мобильной версии приложения. Пожалуйста, воспользуйтесь веб-версией системы.',
                            //       style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w400,
                            //         color: secondary500,
                            //       ),
                            //     ),
                            //     actions: [
                            //       WButton(
                            //         text: 'Понятно',
                            //         onTap: () => Navigator.pop(context),
                            //       )
                            //     ],
                            //   ),
                            // );
                          },
                          mainTitle:
                              state.draftsMemoModel.documents[index].number,
                          title1: 'Дата:',
                          subtitle1: MyFunction.dateFormatDate(
                            state.draftsMemoModel.documents[index].date
                                .toString(),
                          ),
                          title2: 'Тема:',
                          subtitle2:
                              state.draftsMemoModel.documents[index].subject,
                          title3: 'Отправитель:',
                          subtitle3: state.draftsMemoModel.documents[index]
                                  .fromName.isEmpty
                              ? "-"
                              : state.draftsMemoModel.documents[index].fromName,
                          title4: 'Получатель:',
                          subtitle4: state.draftsMemoModel.documents[index]
                                  .toName.isEmpty
                              ? "-"
                              : state.draftsMemoModel.documents[index].toName,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: state.draftsMemoModel.documents.length,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
