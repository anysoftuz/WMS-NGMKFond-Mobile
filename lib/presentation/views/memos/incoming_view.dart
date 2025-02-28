import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/data/models/filter_model.dart';
import 'package:sklad/presentation/views/home/pdf_gen_view.dart';
import 'package:sklad/presentation/widgets/empty_iteam.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_shimmer.dart';
import 'package:sklad/utils/my_function.dart';

class IncomingView extends StatefulWidget {
  const IncomingView({super.key});

  @override
  State<IncomingView> createState() => _IncomingViewState();
}

class _IncomingViewState extends State<IncomingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TitileFilter(
              text: 'Входящие',
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
                          docType: 'memo',
                          number: controllerNumber.text,
                          subject: controllerOtp.text,
                          fromDate: controllerDate1.text),
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
                    return EmptyIteam(
                      onRefresh: () {
                        context.read<HomeBloc>().add(GetReceivedEvent(
                              model: FilterModel(docType: 'memo'),
                            ));
                      },
                    );
                  }
                  return RefreshIndicator.adaptive(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(GetReceivedEvent(
                            model: FilterModel(docType: 'memo'),
                          ));
                      await Future.delayed(Duration.zero);
                    },
                    child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // context.push(AppRouteName.pdfView, extra: {
                          //   'title':
                          //       state.draftsMemoModel.documents[index].number,
                          //   'id': state.draftsMemoModel.documents[index].id,
                          // });
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                            builder: (context) => PdfGenView(
                              document: state.draftsMemoModel.documents[index],
                              isMemos: true,
                            ),
                          ));
                        },
                        child: InformationIteam(
                          onTap: () {
                            // context.push(AppRouteName.pdfView, extra: {
                            //   'title':
                            //       state.draftsMemoModel.documents[index].number,
                            //   'id': state.draftsMemoModel.documents[index].id,
                            // });

                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => PdfGenView(
                                document:
                                    state.draftsMemoModel.documents[index],
                                isMemos: true,
                              ),
                            ));
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
