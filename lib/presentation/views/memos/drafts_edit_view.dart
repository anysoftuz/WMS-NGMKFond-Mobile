import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/data/models/document_show_model.dart';
import 'package:sklad/data/models/drafts_memo_model.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/bottom_info_button.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_preview_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/utils/my_function.dart';

class DraftsEditView extends StatefulWidget {
  const DraftsEditView({super.key, required this.document});
  final Document document;

  @override
  State<DraftsEditView> createState() => _DraftsEditViewState();
}

class _DraftsEditViewState extends State<DraftsEditView> {
  final OverlayPortalController _controller = OverlayPortalController();
  late TextEditingController controllerNumber;
  late TextEditingController controllerKomu;
  late TextEditingController controllerTema;
  late TextEditingController controllerNote;
  ValueNotifier<int> valueNotifier = ValueNotifier(-1);
  DocumentShowModel? documentShowModel;

  @override
  void initState() {
    controllerNote = TextEditingController();
    context.read<HomeBloc>().add(GetDocumentShowEvent(
          id: widget.document.id,
          onSucces: (model) {
            documentShowModel = model;
            controllerNote.text = model.document.content;
            setState(() {});
          },
        ));
    controllerNumber = TextEditingController(text: widget.document.number);
    controllerKomu = TextEditingController(text: widget.document.toName);
    controllerTema = TextEditingController(text: widget.document.subject);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document.number)),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomInfoButton(
            onTap1: () {
              if (controllerNumber.text.isNotEmpty &&
                  controllerKomu.text.isNotEmpty &&
                  controllerNote.text.isNotEmpty &&
                  controllerTema.text.isNotEmpty) {
                context.read<HomeBloc>().add(UpdateDocEvent(
                      id: widget.document.id,
                      data: {
                        'content': controllerNote.text,
                        'date': MyFunction.dateFormatDate(
                            DateTime.now().toString()),
                        'from': "43_user",
                        'from_id':
                            context.read<AuthBloc>().state.userModel.user?.id,
                        'from_type': "user",
                        'status': "draft",
                        'subject': controllerTema.text,
                        'to_id': controllerKomu.text == widget.document.toName
                            ? documentShowModel?.document.toId
                            : state.respondentsListModel
                                .respondents[valueNotifier.value].id,
                        'to_type': "user"
                      },
                      onSucces: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                    ));
              } else {
                CustomSnackbar.show(context, "Malumotni to'liq kirgazing");
              }
            },
            onTap2: () {
              if (controllerNumber.text.isNotEmpty &&
                  controllerKomu.text.isNotEmpty &&
                  controllerNote.text.isNotEmpty &&
                  controllerTema.text.isNotEmpty) {
                context.read<HomeBloc>().add(UpdateDocEvent(
                      id: widget.document.id,
                      data: {
                        'content': controllerNote.text,
                        'date': MyFunction.dateFormatDate(
                            DateTime.now().toString()),
                        'from': "43_user",
                        'from_id':
                            context.read<AuthBloc>().state.userModel.user?.id,
                        'from_type': "user",
                        'status': "sent",
                        'subject': controllerTema.text,
                        'to_id': controllerKomu.text == widget.document.toName
                            ? documentShowModel?.document.toId
                            : state.respondentsListModel
                                .respondents[valueNotifier.value].id,
                        'to_type': "user"
                      },
                      onSucces: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                    ));
              } else {
                CustomSnackbar.show(context, "Malumotni to'liq kirgazing");
              }
            },
            isLoading: state.status.isInProgress,
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              title: 'Название документа',
              hintText: 'Служебная записка',
              readOnly: true,
              fillColor: scaffoldSecondaryBackground,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: '№ документа',
                    hintText: 'Введите',
                    controller: controllerNumber,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: 'Дата создания документа',
                    hintText: MyFunction.dateFormatDate(
                      widget.document.date.toString(),
                    ),
                    readOnly: true,
                    fillColor: scaffoldSecondaryBackground,
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return RawFlexDropDown(
                  controller: _controller,
                  buttonBuilder: (context, onTap) => CustomTextField(
                    onPressed: onTap,
                    title: 'Кому',
                    hintText: 'Выберите',
                    controller: controllerKomu,
                    readOnly: true,
                    suffixIcon: AppIcons.chevronDown.svg(),
                    onsuffixIconPressed: onTap,
                    onChanged: (value) {},
                  ),
                  menuBuilder: (context, width) => Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: width,
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    decoration: BoxDecoration(
                      color: whiteGrey,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: bg00),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 32,
                          offset: Offset(0, 20),
                          spreadRadius: -8,
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) => WScaleAnimation(
                        onTap: () {
                          _controller.hide();
                          valueNotifier.value = index;
                          controllerKomu.text = state
                              .respondentsListModel.respondents[index].name;
                        },
                        child: Text(
                          state.respondentsListModel.respondents[index].name,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: state.respondentsListModel.respondents.length,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Тема',
              hintText: 'О получении товара',
              controller: controllerTema,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Сообщения',
              hintText: 'Отображение сообщения служебки',
              minLines: 5,
              maxLines: 5,
              noHeight: true,
              controller: controllerNote,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Отправитель',
              hintText: widget.document.fromName,
              readOnly: true,
              fillColor: scaffoldSecondaryBackground,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            WPreviewButton(
              onTap: () {
                context.push(AppRouteName.pdfView, extra: {
                  'title': widget.document.number,
                  'id': widget.document.id,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
