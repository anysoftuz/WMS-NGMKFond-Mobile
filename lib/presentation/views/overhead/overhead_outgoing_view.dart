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
import 'package:sklad/utils/my_function.dart';

class OverheadOutgoingView extends StatefulWidget {
  const OverheadOutgoingView({super.key});

  @override
  State<OverheadOutgoingView> createState() => _OverheadOutgoingViewState();
}

class _OverheadOutgoingViewState extends State<OverheadOutgoingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const SafeArea(
      //   child: PaginationIndexIteam(length: 8),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TitileFilter(
              text: 'Исходящие нак.',
              onFilter: (
                controllerNumber,
                controllerTema,
                controllerKomu,
                controllerOtp,
                controllerDate1,
                controllerDate2,
              ) {
                context.read<HomeBloc>().add(GetSentEvent(
                      model: FilterModel(
                        docType: 'invoice',
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
                  return RefreshIndicator.adaptive(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(GetSentEvent(
                            model: FilterModel(docType: 'invoice'),
                          ));
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
                        title2: 'Основание:',
                        subtitle2: 'Назначение №2392',
                        title3: 'От кого:',
                        subtitle3: 'Зарафшан',
                        title4: 'Кому:',
                        subtitle4: 'Фонд',
                        title5: 'Способ отправления:',
                        subtitle5: '85 897 VAA',
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
