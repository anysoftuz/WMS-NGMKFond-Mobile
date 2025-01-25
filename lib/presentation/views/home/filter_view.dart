import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sklad/app/home/home_bloc.dart';
// import 'package:intl/intl.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/utils/utils.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    super.key,
    required this.controllerNumber,
    required this.controllerTema,
    required this.controllerKomu,
    required this.controllerOtp,
    required this.controllerDate1,
    required this.controllerDate2,
  });
  final TextEditingController controllerNumber;
  final TextEditingController controllerTema;
  final TextEditingController controllerKomu;
  final TextEditingController controllerOtp;
  final TextEditingController controllerDate1;
  final TextEditingController controllerDate2;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final OverlayPortalController _controller1 = OverlayPortalController();
  final OverlayPortalController _controller2 = OverlayPortalController();
  late DateTime dateTime;
  late DateTime dateTime1;

  @override
  void initState() {
    dateTime = DateTime.now();
    dateTime1 = DateTime.now();
    super.initState();
  }

  clearController() {
    widget.controllerNumber.clear();
    widget.controllerTema.clear();
    widget.controllerKomu.clear();
    widget.controllerOtp.clear();
    widget.controllerDate1.clear();
    widget.controllerDate2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Фильтр"),
        actions: [
          TextButton(
            onPressed: () {
              clearController();
            },
            child: const Text(
              "Сбросить",
              style: TextStyle(color: red),
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          onTap: () {
            Navigator.of(context).pop(true);
          },
          text: 'Применить',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    title: "с этой даты",
                    hintText: 'дд.мм.гггг',
                    controller: widget.controllerDate1,
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onprefixIconPressed: () {
                      Utils.showSheet(
                        context,
                        child: buildDatePicker(dateTime),
                        onClicked: () {
                          final value =
                              DateFormat('dd/MM/yyyy').format(dateTime);
                          widget.controllerDate1.text = value;
                          Navigator.pop(context);
                        },
                      );
                    },
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    title: "по эту дату",
                    hintText: 'дд.мм.гггг',
                    controller: widget.controllerDate2,
                    prefixIcon: AppIcons.calendarMinus.svg(),
                    onprefixIconPressed: () {
                      Utils.showSheet(
                        context,
                        child: buildDatePicker(dateTime1),
                        onClicked: () {
                          final value =
                              DateFormat('dd/MM/yyyy').format(dateTime1);
                          widget.controllerDate2.text = value;
                          Navigator.pop(context);
                        },
                      );
                    },
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Номер документа",
              hintText: 'Введите',
              controller: widget.controllerNumber,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Тема",
              hintText: 'Введите',
              controller: widget.controllerTema,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.respondentsListModel.respondents.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    RawFlexDropDown(
                      controller: _controller1,
                      buttonBuilder: (context, onTap) => CustomTextField(
                        onPressed: onTap,
                        title: "Кому",
                        hintText: 'Выберите',
                        controller: widget.controllerKomu,
                        readOnly: true,
                        suffixIcon: AppIcons.chevronDown.svg(),
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
                              _controller1.hide();
                              widget.controllerKomu.text = state
                                  .respondentsListModel.respondents[index].name;
                            },
                            child: Text(
                              state
                                  .respondentsListModel.respondents[index].name,
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount:
                              state.respondentsListModel.respondents.length,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RawFlexDropDown(
                      controller: _controller2,
                      buttonBuilder: (context, onTap) => CustomTextField(
                        onPressed: onTap,
                        title: "Отправитель",
                        hintText: 'Выберите',
                        controller: widget.controllerOtp,
                        readOnly: true,
                        suffixIcon: AppIcons.chevronDown.svg(),
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
                              _controller2.hide();
                              widget.controllerOtp.text = state
                                  .respondentsListModel.respondents[index].name;
                            },
                            child: Text(
                              state
                                  .respondentsListModel.respondents[index].name,
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount:
                              state.respondentsListModel.respondents.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(DateTime? initialDateTime) => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          initialDateTime: initialDateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
