import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/bottom_info_button.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/utils/my_function.dart';

class MemoCreateView extends StatefulWidget {
  const MemoCreateView({super.key});

  @override
  State<MemoCreateView> createState() => _MemoCreateViewState();
}

class _MemoCreateViewState extends State<MemoCreateView> {
  final OverlayPortalController _controller = OverlayPortalController();
  late TextEditingController controllerKomu;
  late TextEditingController controllerTema;
  late TextEditingController controllerDocNum;
  late TextEditingController controllerNote;
  ValueNotifier<int> valueNotifier = ValueNotifier(-1);
  @override
  void initState() {
    controllerKomu = TextEditingController();
    controllerTema = TextEditingController();
    controllerDocNum = TextEditingController();
    controllerNote = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerKomu.dispose();
    controllerTema.dispose();
    controllerDocNum.dispose();
    controllerNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Служебная записка")),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomInfoButton(
            onTap1: () {
              if (controllerDocNum.text.isNotEmpty &&
                  controllerKomu.text.isNotEmpty &&
                  controllerNote.text.isNotEmpty &&
                  controllerTema.text.isNotEmpty) {
                context.read<HomeBloc>().add(CreateDocEvent(
                      data: {
                        'content': controllerNote.text,
                        'date': MyFunction.dateFormatDate(
                            DateTime.now().toString()),
                        'doc_type_id': 1,
                        'from': "43_user",
                        'from_id':
                            context.read<AuthBloc>().state.userModel.user?.id,
                        'from_type': "kitchenWarehouse",
                        'number': controllerDocNum.text,
                        'status': "draft",
                        'subject': controllerTema.text,
                        'to_id': state.respondentsListModel
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
              if (controllerDocNum.text.isNotEmpty &&
                  controllerKomu.text.isNotEmpty &&
                  controllerNote.text.isNotEmpty &&
                  controllerTema.text.isNotEmpty) {
                context.read<HomeBloc>().add(CreateDocEvent(
                      data: {
                        'content': controllerNote.text,
                        'date': MyFunction.dateFormatDate(
                            DateTime.now().toString()),
                        'doc_type_id': 1,
                        'from': "43_user",
                        'from_id':
                            context.read<AuthBloc>().state.userModel.user?.id,
                        'from_type': "kitchenWarehouse",
                        'number': controllerDocNum.text,
                        'status': "sent",
                        'subject': controllerTema.text,
                        'to_id': state.respondentsListModel
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
              fillColor: borderColor,
              readOnly: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: '№ документа',
                    hintText: 'Введите',
                    controller: controllerDocNum,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: 'Дата создания документа',
                    hintText:
                        '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                    fillColor: borderColor,
                    readOnly: true,
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
                          controllerKomu.text = state
                              .respondentsListModel.respondents[index].name;
                          valueNotifier.value = index;
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
              fillColor: borderColor,
              readOnly: true,
              hintText:
                  '${context.read<AuthBloc>().state.userModel.user?.firstname} ${context.read<AuthBloc>().state.userModel.user?.lastname}',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            // WPreviewButton(
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
