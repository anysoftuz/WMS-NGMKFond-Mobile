import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_shimmer.dart';
import 'package:sklad/presentation/widgets/w_tabbar.dart';
import 'package:sklad/utils/my_function.dart';

class SentView extends StatefulWidget {
  const SentView({super.key});

  @override
  State<SentView> createState() => _SentViewState();
}

class _SentViewState extends State<SentView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetSentEvent(docType: 'simple_demand'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TitileFilter(text: 'Отправленные запро...'),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: WTabBar(
              onTap: (p0) {
                if (p0 == 0) {
                  context
                      .read<HomeBloc>()
                      .add(GetSentEvent(docType: 'simple_demand'));
                } else if (p0 == 1) {
                  context
                      .read<HomeBloc>()
                      .add(GetSentEvent(docType: 'monthly_demand'));
                } else {
                  context
                      .read<HomeBloc>()
                      .add(GetSentEvent(docType: 'yearly_demand'));
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
                        context
                            .read<HomeBloc>()
                            .add(GetSentEvent(docType: 'simple_demand'));
                        await Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        itemBuilder: (context, index) => InformationIteam(
                          onTap: () {
                            context.push(AppRouteName.pdfView, extra: {
                              'title':
                                  state.draftsMemoModel.documents[index].number,
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
                              : state.draftsMemoModel.documents[index].fromName,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: 12,
                      ),
                    );
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
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
                    return RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context
                            .read<HomeBloc>()
                            .add(GetSentEvent(docType: 'monthly_demand'));
                        await Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        itemBuilder: (context, index) => InformationIteam(
                          onTap: () {
                            context.push(AppRouteName.pdfView, extra: {
                              'title':
                                  state.draftsMemoModel.documents[index].number,
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
                              : state.draftsMemoModel.documents[index].fromName,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: 12,
                      ),
                    );
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
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
                    return RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context
                            .read<HomeBloc>()
                            .add(GetSentEvent(docType: 'yearly_demand'));
                        await Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        itemBuilder: (context, index) => InformationIteam(
                          onTap: () {
                            context.push(AppRouteName.pdfView, extra: {
                              'title':
                                  state.draftsMemoModel.documents[index].number,
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
                              : state.draftsMemoModel.documents[index].fromName,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: 12,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
