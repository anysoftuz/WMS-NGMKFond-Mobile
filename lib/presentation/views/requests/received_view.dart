import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/data/models/filter_model.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_shimmer.dart';
import 'package:sklad/presentation/widgets/w_tabbar.dart';
import 'package:sklad/utils/my_function.dart';

class ReceivedView extends StatefulWidget {
  const ReceivedView({super.key});

  @override
  State<ReceivedView> createState() => _ReceivedViewState();
}

class _ReceivedViewState extends State<ReceivedView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TitileFilter(
                text: 'Исходящие запросы',
                onFilter: (
                  controllerNumber,
                  controllerTema,
                  controllerKomu,
                  controllerOtp,
                  controllerDate1,
                  controllerDate2,
                ) {
                  context.read<HomeBloc>().add(GetReceivedEvent(
                        model: FilterModel(
                          docType: 'simple_demand',
                          number: controllerNumber.text,
                          subject: controllerOtp.text,
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WTabBar(
                onTap: (p0) {
                  if (p0 == 0) {
                    context.read<HomeBloc>().add(GetReceivedEvent(
                        model: FilterModel(docType: 'simple_demand')));
                  } else if (p0 == 1) {
                    context.read<HomeBloc>().add(GetReceivedEvent(
                        model: FilterModel(docType: 'monthly_demand')));
                  } else {
                    context.read<HomeBloc>().add(GetReceivedEvent(
                        model: FilterModel(docType: 'yearly_demand')));
                  }
                },
                tabs: const [
                  Text('Свободный'),
                  Text('Месячный'),
                  Text('Годовой'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.statusDraftsMemo.isInProgress) {
                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          itemBuilder: (context, index) => const WShimmer(
                            height: 220,
                            width: double.infinity,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: 12,
                        );
                      }
                      return RefreshIndicator.adaptive(
                        onRefresh: () async {
                          context.read<HomeBloc>().add(GetReceivedEvent(
                              model: FilterModel(docType: 'simple_demand')));

                          await Future.delayed(Duration.zero);
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) => InformationIteam(
                            onTap: () {
                              context.push(AppRouteName.pdfView, extra: {
                                'title': state
                                    .draftsMemoModel.documents[index].number,
                                'id': state.draftsMemoModel.documents[index].id,
                              });
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
                                : state
                                    .draftsMemoModel.documents[index].fromName,
                            title4: 'Тип запроса:',
                            subtitle4: state.draftsMemoModel.documents[index]
                                    .toName.isEmpty
                                ? "-"
                                : state.draftsMemoModel.documents[index].toName,
                          ),
                          itemCount: state.draftsMemoModel.documents.length,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.statusDraftsMemo.isInProgress) {
                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          itemBuilder: (context, index) => const WShimmer(
                            height: 220,
                            width: double.infinity,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: 12,
                        );
                      }
                      return RefreshIndicator.adaptive(
                        onRefresh: () async {
                          context.read<HomeBloc>().add(GetReceivedEvent(
                              model: FilterModel(docType: 'monthly_demand')));

                          await Future.delayed(Duration.zero);
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) => InformationIteam(
                            onTap: () {
                              context.push(AppRouteName.pdfView, extra: {
                                'title': state
                                    .draftsMemoModel.documents[index].number,
                                'id': state.draftsMemoModel.documents[index].id,
                              });
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
                                : state
                                    .draftsMemoModel.documents[index].fromName,
                            title4: 'Тип запроса:',
                            subtitle4: state.draftsMemoModel.documents[index]
                                    .toName.isEmpty
                                ? "-"
                                : state.draftsMemoModel.documents[index].toName,
                          ),
                          itemCount: state.draftsMemoModel.documents.length,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.statusDraftsMemo.isInProgress) {
                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          itemBuilder: (context, index) => const WShimmer(
                            height: 220,
                            width: double.infinity,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: 12,
                        );
                      }
                      return RefreshIndicator.adaptive(
                        onRefresh: () async {
                          context.read<HomeBloc>().add(GetReceivedEvent(
                              model: FilterModel(docType: 'yearly_demand')));
                          await Future.delayed(Duration.zero);
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) => InformationIteam(
                            onTap: () {
                              context.push(AppRouteName.pdfView, extra: {
                                'title': state
                                    .draftsMemoModel.documents[index].number,
                                'id': state.draftsMemoModel.documents[index].id,
                              });
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
                                : state
                                    .draftsMemoModel.documents[index].fromName,
                            title4: 'Тип запроса:',
                            subtitle4: state.draftsMemoModel.documents[index]
                                    .toName.isEmpty
                                ? "-"
                                : state.draftsMemoModel.documents[index].toName,
                          ),
                          itemCount: state.draftsMemoModel.documents.length,
                        ),
                      );
                    },
                  ),
                  // ListView(
                  //   padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  //   children: [
                  //     ...List.generate(
                  //       8,
                  //       (index) => const Padding(
                  //         padding: EdgeInsets.only(bottom: 12),
                  //         child: InformationIteam(
                  //           mainTitle: "№ запроса: Z-45896",
                  //           title1: 'Дата:',
                  //           subtitle1: '23.08.2024',
                  //           title2: 'Тема:',
                  //           subtitle2: 'Доставка мяса',
                  //           title3: 'Отправитель:',
                  //           subtitle3: 'Зарафшан',
                  //           title4: 'Тип запроса:',
                  //           subtitle4: 'Полученные',
                  //         ),
                  //       ),
                  //     ),
                  //     const PaginationIndexIteam(length: 8),
                  //     const SizedBox(height: 12),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
