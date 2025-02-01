import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:sklad/app/bloc/doc_create_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/data/models/overhead_model.dart';
import 'package:sklad/data/models/product_types_model.dart';
import 'package:sklad/presentation/views/home/receipt.dart';
import 'package:sklad/presentation/widgets/custom_snackbar.dart';
import 'package:sklad/presentation/widgets/custom_text_field.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_preview_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/presentation/widgets/w_show_dialog.dart';
import 'package:sklad/utils/formatters.dart';
import 'package:sklad/utils/log_service.dart';
import 'package:sklad/utils/my_function.dart';
import 'package:sklad/utils/utils.dart';

part 'package:sklad/presentation/views/home/controller/create_parish_mixin.dart';

class CreateParishView extends StatefulWidget {
  const CreateParishView({super.key});

  @override
  State<CreateParishView> createState() => _CreateParishViewState();
}

class _CreateParishViewState extends State<CreateParishView>
    with CreateParishMixin {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        popDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Создать приход")),
        bottomNavigationBar: BlocBuilder<DocCreateBloc, DocCreateState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: WButton(
                        onTap: () {
                          popDialog(context);
                        },
                        text: 'Отменить',
                        color: bg00,
                        textColor: backgroundText,
                      ),
                    ),
                    Expanded(
                      child: WButton(
                        onTap: () {
                          if (anyControllerIsEmpty()) {
                            CustomSnackbar.show(
                              context,
                              "Malumotlarni kiriting",
                            );
                          } else {
                            final document = getDoc(state);
                            Log.i(document.toJson());
                            context.read<DocCreateBloc>().add(PostDocEvent(
                                  data: document.toJson(),
                                  onSucces: () {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
                                  },
                                ));
                          }
                        },
                        isLoading: state.statusCreate.isInProgress,
                        text: 'Отправить',
                        color: green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                title: 'Название документа',
                hintText: 'Входящий накладной',
                readOnly: true,
                fillColor: scaffoldSecondaryBackground,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: 'Дата создания документа',
                hintText: MyFunction.dateFormatDate(DateTime.now().toString()),
                prefixIcon: AppIcons.calendarMinus.svg(),
                readOnly: true,
                fillColor: scaffoldSecondaryBackground,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: '№ накладной в системе',
                hintText: 'Автоматически',
                readOnly: true,
                fillColor: scaffoldSecondaryBackground,
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: '№ накладной',
                      hintText: 'Введите № документа',
                      controller: controllerNumber,
                      isRequired: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      title: 'Дата накладной',
                      hintText: 'дд.мм.гггг',
                      isRequired: true,
                      prefixIcon: AppIcons.calendarMinus.svg(),
                      controller: controllerDate,
                      readOnly: true,
                      onPressed: () {
                        DateTime dateTime =
                            MyFunction.dateToDate(controllerDate.text);
                        Utils.showSheet(
                          context,
                          child: SizedBox(
                            height: 180,
                            child: CupertinoDatePicker(
                              minimumYear: 2015,
                              maximumYear: DateTime.now().year,
                              initialDateTime: dateTime,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (dateTime2) =>
                                  setState(() => dateTime = dateTime2),
                            ),
                          ),
                          onClicked: () {
                            final value =
                                DateFormat('dd.MM.yyyy').format(dateTime);
                            controllerDate.text = value;
                            Navigator.pop(context);
                          },
                        );
                      },
                      onprefixIconPressed: () {
                        DateTime dateTime =
                            MyFunction.dateToDate(controllerDate.text);
                        Utils.showSheet(
                          context,
                          child: SizedBox(
                            height: 180,
                            child: CupertinoDatePicker(
                              minimumYear: 2015,
                              maximumYear: DateTime.now().year,
                              initialDateTime: dateTime,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (dateTime2) =>
                                  setState(() => dateTime = dateTime2),
                            ),
                          ),
                          onClicked: () {
                            final value =
                                DateFormat('dd.MM.yyyy').format(dateTime);
                            controllerDate.text = value;
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              BlocBuilder<DocCreateBloc, DocCreateState>(
                builder: (context, state) {
                  return RawFlexDropDown(
                    controller: _controller1,
                    buttonBuilder: (context, onTap) => CustomTextField(
                      onPressed: onTap,
                      title: 'От кого',
                      hintText: 'Выберите отправителя',
                      isRequired: true,
                      controller: controllerKogo,
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
                            _controller1.hide();
                            indexProvider = index;
                            controllerKogo.text = state
                                .respondentsProvider.respondents[index].name;
                          },
                          child: Text(
                            state.respondentsProvider.respondents[index].name,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: state.respondentsProvider.respondents.length,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<DocCreateBloc, DocCreateState>(
                builder: (context, state) {
                  return RawFlexDropDown(
                    controller: _controller2,
                    buttonBuilder: (context, onTap) => CustomTextField(
                      onPressed: onTap,
                      title: 'Кому',
                      hintText: 'Выберите получателя',
                      isRequired: true,
                      controller: controllerKomu,
                      readOnly: true,
                      suffixIcon: AppIcons.chevronDown.svg(),
                      onsuffixIconPressed: onTap,
                      onChanged: (value) {},
                    ),
                    menuBuilder: (context, width) => DropContainerIteam(
                      width: width,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => WScaleAnimation(
                          onTap: () {
                            _controller2.hide();
                            indexBase = index;
                            controllerKomu.text =
                                state.respondentsBase.respondents[index].name;
                          },
                          child: Text(
                            state.respondentsBase.respondents[index].name,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: state.respondentsBase.respondents.length,
                      ),
                    ),
                  );
                },
              ),
              CustomTextField(
                title: 'Через кого',
                hintText: 'Введите экспедитора',
                controller: throughWhom,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: 'Основание',
                hintText: 'Введите основание',
                isRequired: true,
                controller: foundation,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: 'Способ отправления',
                hintText: 'Введите способ отправления',
                isRequired: true,
                controller: methodOfDispatch,
                onChanged: (value) {},
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteGrey,
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      tableOfReceivedProducts.length,
                      (index) => ExpansionTile(
                        title: Row(
                          spacing: 12,
                          children: [
                            Expanded(
                              child: Text(
                                "${tableOfReceivedProducts.length > 1 ? index + 1 : ""}Таблица получаемых продуктов",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (tableOfReceivedProducts.length > 1)
                              WScaleAnimation(
                                onTap: () {
                                  tableOfReceivedProducts.removeAt(index);
                                  productInfo.removeAt(index);
                                  setState(() {});
                                },
                                child: AppIcons.trash.svg(),
                              ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Column(
                              children: [
                                BlocBuilder<DocCreateBloc, DocCreateState>(
                                  builder: (context, state) {
                                    return RawFlexDropDown(
                                      controller: tableOfReceivedProducts[index]
                                          .controller1,
                                      buttonBuilder: (context, onTap) =>
                                          CustomTextField(
                                        onPressed: onTap,
                                        title: 'Тип продукта',
                                        hintText: 'Введите тип продукта',
                                        fillColor: white,
                                        controller:
                                            tableOfReceivedProducts[index]
                                                .controllerCategory,
                                        readOnly: true,
                                        suffixIcon: AppIcons.chevronDown.svg(),
                                        onsuffixIconPressed: onTap,
                                        onChanged: (value) {},
                                      ),
                                      menuBuilder: (context, width) =>
                                          DropContainerIteam(
                                        width: width,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index2) =>
                                              WScaleAnimation(
                                            onTap: () {
                                              context
                                                  .read<DocCreateBloc>()
                                                  .add(GetTypesEvent(
                                                    id: state
                                                        .productCategoriesModel
                                                        .productCategories[
                                                            index2]
                                                        .id,
                                                    onSucces:
                                                        (productTypesModel) {
                                                      tableOfReceivedProducts[
                                                                  index]
                                                              .productType =
                                                          productTypesModel
                                                                  ?.productTypes ??
                                                              [];
                                                      setState(() {});
                                                    },
                                                  ));
                                              tableOfReceivedProducts[index]
                                                  .controller1
                                                  .hide();
                                              indexCategories = index2;
                                              tableOfReceivedProducts[index]
                                                      .controllerCategory
                                                      .text =
                                                  state
                                                      .productCategoriesModel
                                                      .productCategories[index2]
                                                      .name;
                                            },
                                            child: Text(
                                              state
                                                  .productCategoriesModel
                                                  .productCategories[index2]
                                                  .name,
                                            ),
                                          ),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 8),
                                          itemCount: state
                                              .productCategoriesModel
                                              .productCategories
                                              .length,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                BlocBuilder<DocCreateBloc, DocCreateState>(
                                  builder: (context, state) {
                                    return RawFlexDropDown(
                                      controller: tableOfReceivedProducts[index]
                                          .controller2,
                                      buttonBuilder: (context, onTap) =>
                                          CustomTextField(
                                        onPressed: onTap,
                                        title: 'Вид продукта',
                                        hintText: 'Выберите вид продукта',
                                        fillColor: white,
                                        controller:
                                            tableOfReceivedProducts[index]
                                                .controllerType,
                                        readOnly: true,
                                        suffixIcon: AppIcons.chevronDown.svg(),
                                        onsuffixIconPressed: onTap,
                                        onChanged: (value) {},
                                      ),
                                      menuBuilder: (context, width) =>
                                          DropContainerIteam(
                                        width: width,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index2) =>
                                              WScaleAnimation(
                                            onTap: () {
                                              tableOfReceivedProducts[index]
                                                  .controller2
                                                  .hide();
                                              indexType = index2;
                                              productInfo[index].productType =
                                                  tableOfReceivedProducts[index]
                                                      .productType[index2];
                                              tableOfReceivedProducts[index]
                                                      .controllerType
                                                      .text =
                                                  tableOfReceivedProducts[index]
                                                      .productType[index2]
                                                      .name;
                                            },
                                            child: Text(
                                              tableOfReceivedProducts[index]
                                                  .productType[index2]
                                                  .name,
                                            ),
                                          ),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 8),
                                          itemCount:
                                              tableOfReceivedProducts[index]
                                                  .productType
                                                  .length,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        title: 'Количество',
                                        hintText: 'Введите количество продукта',
                                        fillColor: white,
                                        keyboardType: TextInputType.number,
                                        formatter: [Formatters.numberFormat],
                                        controller:
                                            tableOfReceivedProducts[index]
                                                .controllerQuantity,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: CustomTextField(
                                        title: 'Ед. измерения',
                                        hintText: productInfo[index]
                                                .productType
                                                ?.unit ??
                                            'Выберите',
                                        fillColor: scaffoldSecondaryBackground,
                                        readOnly: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                CustomTextField(
                                  title: 'Цена',
                                  hintText: 'Введите цену за единицу продукта',
                                  fillColor: white,
                                  formatter: [Formatters.numberFormat],
                                  keyboardType: TextInputType.number,
                                  controller: tableOfReceivedProducts[index]
                                      .controllerPrice,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(height: 1),
                    ),
                    WButton(
                      onTap: () {
                        tableOfReceivedProducts.add(TableOfReceivedProducts());
                        productInfo.add(ProductInfo());
                        setState(() {});
                      },
                      height: 40,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      borderRadius: 8,
                      border: Border.all(color: blue),
                      color: Colors.transparent,
                      textColor: blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppIcons.squarePlus.svg(color: blue),
                          const SizedBox(width: 12),
                          const Text("Добавить")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              CustomTextField(
                title: 'АКТ',
                hintText: 'АКТ',
                readOnly: true,
                fillColor: scaffoldSecondaryBackground,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: '№ накладной в системе',
                hintText:
                    controllerNumber.text.isEmpty || controllerDate.text.isEmpty
                        ? 'Автоматически'
                        : "${controllerNumber.text} ${controllerDate.text}",
                readOnly: true,
                fillColor: scaffoldSecondaryBackground,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: '№ Акта',
                hintText: 'Введите номер акта',
                isRequired: true,
                controller: controllerActNumber,
                onChanged: (value) {},
              ),
              CustomTextField(
                title: 'Содержание акта',
                hintText: 'Введите содержание акта',
                minLines: 5,
                maxLines: 5,
                noHeight: true,
                controller: controllerActDes,
                onChanged: (value) {},
              ),
              ...List.generate(
                productInfo.length,
                (index) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: whiteGrey,
                  ),
                  child: ExpansionTile(
                    title: Text('Продукт ${index + 1}'),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                    children: [
                      CustomTextField(
                        title: 'Номер договора о поставке',
                        hintText: 'Введите номер договора',
                        controller: productInfo[index].supplyContractNumber,
                        isRequired: true,
                        fillColor: white,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        title: 'Дата договора о поставке',
                        hintText: 'Дата договора о поставке',
                        controller: productInfo[index].dateOfTheSupplyAgreement,
                        isRequired: true,
                        readOnly: true,
                        fillColor: white,
                        prefixIcon: AppIcons.calendarMinus.svg(),
                        onePress: true,
                        onPressed: () {
                          DateTime dateTime = MyFunction.dateToDate(
                              productInfo[index].dateOfTheSupplyAgreement.text);
                          Utils.showSheet(
                            context,
                            child: SizedBox(
                              height: 180,
                              child: CupertinoDatePicker(
                                minimumYear: 2015,
                                maximumYear: DateTime.now().year,
                                initialDateTime: dateTime,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (dateTime2) =>
                                    setState(() => dateTime = dateTime2),
                              ),
                            ),
                            onClicked: () {
                              final value =
                                  DateFormat('dd.MM.yyyy').format(dateTime);
                              productInfo[index].dateOfTheSupplyAgreement.text =
                                  value;
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      const CustomTextField(
                        title: 'Номер и дата накладной',
                        hintText: 'Номер и дата накладной',
                        readOnly: true,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        title: 'Производитель продукта',
                        hintText: 'Введите производителя',
                        controller: productInfo[index].productManufacturer,
                        isRequired: true,
                        fillColor: white,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        title: 'Поставщик',
                        hintText: controllerKogo.text,
                        readOnly: true,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        title: 'Транспорт',
                        hintText: 'Введите транспорт',
                        controller: productInfo[index].transportController,
                        isRequired: true,
                        fillColor: white,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: '№ лицензии',
                              hintText: 'Введите № лицензии',
                              controller: productInfo[index].licenseNumber,
                              isRequired: true,
                              fillColor: white,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              title: 'Дата лицензии',
                              hintText: 'Дата лицензии',
                              controller: productInfo[index].licenseDate,
                              isRequired: true,
                              fillColor: white,
                              prefixIcon: AppIcons.calendarMinus.svg(),
                              onePress: true,
                              onPressed: () {
                                DateTime dateTime = MyFunction.dateToDate(
                                    productInfo[index].licenseDate.text);
                                Utils.showSheet(
                                  context,
                                  child: SizedBox(
                                    height: 180,
                                    child: CupertinoDatePicker(
                                      minimumYear: 2015,
                                      maximumYear: DateTime.now().year,
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (dateTime2) =>
                                          setState(() => dateTime = dateTime2),
                                    ),
                                  ),
                                  onClicked: () {
                                    final value = DateFormat('dd.MM.yyyy')
                                        .format(dateTime);
                                    productInfo[index].licenseDate.text = value;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: '№ заключения Санитарно',
                              hintText: 'Введите № заключения СЭЦ',
                              controller:
                                  productInfo[index].sanitaryConclusionNumber,
                              isRequired: true,
                              fillColor: white,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              title: 'Дата заключения Санитарно',
                              hintText: 'Дата заключения Санитарно',
                              controller:
                                  productInfo[index].sanitaryConclusionDate,
                              isRequired: true,
                              fillColor: white,
                              prefixIcon: AppIcons.calendarMinus.svg(),
                              onePress: true,
                              onPressed: () {
                                DateTime dateTime = MyFunction.dateToDate(
                                    productInfo[index]
                                        .sanitaryConclusionDate
                                        .text);
                                Utils.showSheet(
                                  context,
                                  child: SizedBox(
                                    height: 180,
                                    child: CupertinoDatePicker(
                                      minimumYear: 2015,
                                      maximumYear: DateTime.now().year,
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (dateTime2) =>
                                          setState(() => dateTime = dateTime2),
                                    ),
                                  ),
                                  onClicked: () {
                                    final value = DateFormat('dd.MM.yyyy')
                                        .format(dateTime);
                                    productInfo[index]
                                        .sanitaryConclusionDate
                                        .text = value;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: '№ удостоверения ветеринарии',
                              hintText: 'Введите № удостоверения ветеринарии',
                              controller: productInfo[index]
                                  .veterinaryCertificateNumber,
                              isRequired: true,
                              fillColor: white,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              title: 'Дата удостоверения ветеринарии',
                              hintText: 'Дата удостоверения ветеринарии',
                              controller:
                                  productInfo[index].veterinaryCertificateDate,
                              isRequired: true,
                              fillColor: white,
                              prefixIcon: AppIcons.calendarMinus.svg(),
                              onePress: true,
                              onPressed: () {
                                DateTime dateTime = MyFunction.dateToDate(
                                    productInfo[index]
                                        .veterinaryCertificateDate
                                        .text);
                                Utils.showSheet(
                                  context,
                                  child: SizedBox(
                                    height: 180,
                                    child: CupertinoDatePicker(
                                      minimumYear: 2015,
                                      maximumYear: DateTime.now().year,
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (dateTime2) =>
                                          setState(() => dateTime = dateTime2),
                                    ),
                                  ),
                                  onClicked: () {
                                    final value = DateFormat('dd.MM.yyyy')
                                        .format(dateTime);
                                    productInfo[index]
                                        .veterinaryCertificateDate
                                        .text = value;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: '№ удостоверения качества',
                              hintText: 'Введите № удостоверения качества',
                              controller:
                                  productInfo[index].qualityCertificateNumber,
                              isRequired: true,
                              fillColor: white,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              title: 'Дата удостоверения качества',
                              hintText: 'Дата удостоверения качества',
                              controller:
                                  productInfo[index].qualityCertificateDate,
                              isRequired: true,
                              fillColor: white,
                              prefixIcon: AppIcons.calendarMinus.svg(),
                              onePress: true,
                              onPressed: () {
                                DateTime dateTime = MyFunction.dateToDate(
                                    productInfo[index]
                                        .qualityCertificateDate
                                        .text);
                                Utils.showSheet(
                                  context,
                                  child: SizedBox(
                                    height: 180,
                                    child: CupertinoDatePicker(
                                      minimumYear: 2015,
                                      maximumYear: DateTime.now().year,
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (dateTime2) =>
                                          setState(() => dateTime = dateTime2),
                                    ),
                                  ),
                                  onClicked: () {
                                    final value = DateFormat('dd.MM.yyyy')
                                        .format(dateTime);
                                    productInfo[index]
                                        .qualityCertificateDate
                                        .text = value;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<DocCreateBloc, DocCreateState>(
                builder: (context, state) {
                  return WPreviewButton(
                    onTap: () {
                      final document = getDoc(state);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptPreview(
                            document: document,
                            fromUser: controllerKogo.text,
                            toUser: controllerKomu.text,
                            freight: controllerFreight.text,
                            warehouseManager: controllerWarehouseManager.text,
                            managerBase: controllerManagerBase.text,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    const Text(
                      "Состав комиссии приема продуктов",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    BlocBuilder<DocCreateBloc, DocCreateState>(
                      builder: (context, state) {
                        return RawFlexDropDown(
                          controller: _controller3,
                          buttonBuilder: (context, onTap) => CustomTextField(
                            title: 'Товаровед',
                            hintText: 'Выберите товароведа',
                            isRequired: true,
                            fillColor: white,
                            readOnly: true,
                            controller: controllerFreight,
                            suffixIcon: AppIcons.chevronDown.svg(),
                            onsuffixIconPressed: onTap,
                            onPressed: onTap,
                            onChanged: (value) {},
                          ),
                          menuBuilder: (context, width) => DropContainerIteam(
                            width: width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => WScaleAnimation(
                                onTap: () {
                                  _controller3.hide();
                                  indexMerchandiser = index;
                                  controllerFreight.text =
                                      '${state.usersMerchandiser.users[index].firstname} ${state.usersMerchandiser.users[index].lastname} ${state.usersMerchandiser.users[index].patronymic}';
                                },
                                child: Text(
                                  '${state.usersMerchandiser.users[index].firstname} ${state.usersMerchandiser.users[index].lastname} ${state.usersMerchandiser.users[index].patronymic}',
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemCount: state.usersMerchandiser.users.length,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<DocCreateBloc, DocCreateState>(
                      builder: (context, state) {
                        return RawFlexDropDown(
                          controller: _controller5,
                          buttonBuilder: (context, onTap) => CustomTextField(
                            title: 'Зав. склад',
                            hintText: 'Выберите зав. склада',
                            isRequired: true,
                            fillColor: white,
                            readOnly: true,
                            controller: controllerManagerBase,
                            suffixIcon: AppIcons.chevronDown.svg(),
                            onsuffixIconPressed: onTap,
                            onPressed: onTap,
                            onChanged: (value) {},
                          ),
                          menuBuilder: (context, width) => DropContainerIteam(
                            width: width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => WScaleAnimation(
                                onTap: () {
                                  _controller5.hide();
                                  indexManagerBase = index;
                                  controllerManagerBase.text =
                                      '${state.usersManagerBase.users[index].firstname} ${state.usersManagerBase.users[index].lastname} ${state.usersManagerBase.users[index].patronymic}';
                                },
                                child: Text(
                                  '${state.usersManagerBase.users[index].firstname} ${state.usersManagerBase.users[index].lastname} ${state.usersManagerBase.users[index].patronymic}',
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemCount: state.usersManagerBase.users.length,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<DocCreateBloc, DocCreateState>(
                      builder: (context, state) {
                        return RawFlexDropDown(
                          controller: _controller4,
                          buttonBuilder: (context, onTap) => CustomTextField(
                            title: 'Начальник базы',
                            hintText: 'Выберите начальника базы',
                            isRequired: true,
                            fillColor: white,
                            readOnly: true,
                            onPressed: onTap,
                            controller: controllerWarehouseManager,
                            suffixIcon: AppIcons.chevronDown.svg(),
                            onsuffixIconPressed: onTap,
                            onChanged: (value) {},
                          ),
                          menuBuilder: (context, width) => DropContainerIteam(
                            width: width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => WScaleAnimation(
                                onTap: () {
                                  _controller4.hide();
                                  indexHeadWarehouse = index;
                                  controllerWarehouseManager.text =
                                      '${state.usersHeadWarehouse.users[index].firstname} ${state.usersHeadWarehouse.users[index].lastname} ${state.usersHeadWarehouse.users[index].patronymic}';
                                },
                                child: Text(
                                  '${state.usersHeadWarehouse.users[index].firstname} ${state.usersHeadWarehouse.users[index].lastname} ${state.usersHeadWarehouse.users[index].patronymic}',
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemCount: state.usersHeadWarehouse.users.length,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropContainerIteam extends StatelessWidget {
  const DropContainerIteam({
    super.key,
    required this.width,
    required this.child,
  });
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
