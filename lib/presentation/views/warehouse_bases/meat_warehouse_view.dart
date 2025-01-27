import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/data/models/managements_bases_model.dart';
import 'package:sklad/presentation/views/warehouse_bases/widget/dele.dart';
import 'package:sklad/presentation/widgets/information_iteam.dart';
import 'package:sklad/presentation/widgets/title_filter.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/presentation/widgets/w_tabbar.dart';

class MeatWarehouseView extends StatefulWidget {
  final Base model;
  const MeatWarehouseView({super.key, required this.model});

  @override
  State<MeatWarehouseView> createState() => _MeatWarehouseViewState();
}

class _MeatWarehouseViewState extends State<MeatWarehouseView> {
  final OverlayPortalController _controller = OverlayPortalController();
  @override
  void initState() {
    context.read<HomeBloc>().add(GetWarehousesBeseEvent(id: widget.model.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TitileFilter(
                      text: widget.model.name,
                      onFilter: (
                        controllerNumber,
                        controllerTema,
                        controllerKomu,
                        controllerOtp,
                        controllerDate1,
                        controllerDate2,
                      ) {},
                    ),
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: bg00),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Заполнение склада',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '${state.fillingPercentage.toDouble()}%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                color: green,
                                backgroundColor: bg00,
                                minHeight: 16,
                                value: state.fillingPercentage.toDouble() / 100,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Этот элемент показывает процент заполненности склада, помогая вам следить за остатками и эффективно управлять запасами.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: secondary500,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.warehousesBasesModel.baseWarehouses.isEmpty) {
                        return const SizedBox();
                      }
                      return Container(
                        height: 48,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RawFlexDropDown(
                          controller: _controller,
                          buttonBuilder: (context, onTap) {
                            return WButton(
                              onTap: onTap,
                              color: white,
                              border: Border.all(color: bg00),
                              textColor: backgroundText,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state
                                          .warehousesBasesModel
                                          .baseWarehouses[state.warehousesSel]
                                          .name,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  AppIcons.chevronDown.svg(),
                                ],
                              ),
                            );
                          },
                          menuBuilder: (context, width) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
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
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      WScaleAnimation(
                                    onTap: () {
                                      _controller.hide();
                                      context
                                          .read<HomeBloc>()
                                          .add(GetWarehousesChengeEvent(
                                            id: widget.model.id,
                                            index: index,
                                          ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: state.warehousesSel == index
                                            ? white
                                            : null,
                                        boxShadow: state.warehousesSel == index
                                            ? [
                                                BoxShadow(
                                                  color: const Color(0xFF0A090B)
                                                      .withValues(
                                                    alpha: .07,
                                                  ),
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 1.5),
                                                  spreadRadius: -1,
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Text(
                                        state.warehousesBasesModel
                                            .baseWarehouses[index].name,
                                      ),
                                    ),
                                  ),
                                  itemCount: state.warehousesBasesModel
                                      .baseWarehouses.length,
                                ),
                              ),
                            );
                          },
                        ),
                      );

                      // return Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     spacing: 16,
                      //     children: [
                      //       // Expanded(
                      //       //   child: WButton(
                      //       //     onTap: () {},
                      //       //     color: bg00,
                      //       //     textColor: backgroundText,
                      //       //     text: state.warehousesBasesModel
                      //       //         .baseWarehouses[state.warehousesSel].name,
                      //       //   ),
                      //       // ),
                      //         ],
                      //   ),
                      // );
                    },
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomHeaderDelegate(
                minHeight: 72,
                maxHeight: 72,
                child: Container(
                  color: white,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: const WTabBar(
                    tabs: [
                      Text('По продуктам'),
                      Text('По накладным'),
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    itemBuilder: (context, index) => InformationIteam(
                      isButton: false,
                      mainTitle: state.productsBasesModel
                          .warehouseProducts[index].product.name,
                      title1: 'Количество:',
                      subtitle1: state
                          .productsBasesModel.warehouseProducts[index].quantity
                          .toString(),
                      title3: 'Сумма:',
                      subtitle3: state.productsBasesModel
                          .warehouseProducts[index].priceFormatted,
                      title2: 'Ед. измерения:',
                      subtitle2: state.productsBasesModel
                          .warehouseProducts[index].product.measure,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount:
                        state.productsBasesModel.warehouseProducts.length,
                  );
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    itemBuilder: (context, index) => InformationIteam(
                      isButton: false,
                      mainTitle: state.invoicesBasesModel
                          .warehouseProducts[index].product.name,
                      title1: 'Количество:',
                      subtitle1: state
                          .invoicesBasesModel.warehouseProducts[index].quantity
                          .toString(),
                      title3: 'Сумма:',
                      subtitle3: state.invoicesBasesModel
                          .warehouseProducts[index].priceFormatted,
                      title2: 'Ед. измерения:',
                      subtitle2: state.invoicesBasesModel
                          .warehouseProducts[index].product.measure,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount:
                        state.invoicesBasesModel.warehouseProducts.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginationIndexIteam extends StatefulWidget {
  const PaginationIndexIteam({super.key, required this.length});
  final int length;

  @override
  State<PaginationIndexIteam> createState() => _PaginationIndexIteamState();
}

class _PaginationIndexIteamState extends State<PaginationIndexIteam> {
  ValueNotifier valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WButton(
          height: 48,
          width: 48,
          onTap: () {
            if (valueNotifier.value != 0) {
              valueNotifier.value -= 1;
            }
          },
          color: whiteGrey,
          child: AppIcons.chevronLeft.svg(),
        ),
        const SizedBox(width: 4),
        ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, __) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 260,
                maxHeight: 48,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => WButton(
                  height: 48,
                  width: 48,
                  onTap: () {
                    valueNotifier.value = index;
                  },
                  color: value == index ? null : whiteGrey,
                  textColor: value == index ? white : backgroundText,
                  text: '${index + 1}',
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemCount: widget.length,
              ),
            );
          },
        ),
        const SizedBox(width: 4),
        WButton(
          height: 48,
          width: 48,
          onTap: () {
            if (valueNotifier.value < widget.length) {
              valueNotifier.value += 1;
            }
          },
          color: whiteGrey,
          child: AppIcons.chevronRight.svg(),
        ),
      ],
    );
  }
}
