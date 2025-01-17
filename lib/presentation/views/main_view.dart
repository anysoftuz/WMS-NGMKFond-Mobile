import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 68,
        leading: Row(
          children: [
            const SizedBox(width: 16),
            WButton(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              height: 52,
              width: 52,
              borderRadius: 20,
              color: whiteGrey,
              child: AppIcons.menu2.svg(),
            ),
          ],
        ),
        actions: [
          WButton(
            onTap: () {
              context.push(AppRouteName.filter);
            },
            height: 52,
            width: 52,
            borderRadius: 20,
            color: whiteGrey,
            child: AppIcons.bell.svg(),
          ),
          const SizedBox(width: 12),
          WButton(
            onTap: () {
              context.push(AppRouteName.create);
            },
            height: 52,
            width: 52,
            borderRadius: 20,
            child: AppIcons.squarePlus.svg(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(AppImages.logo),
                contentPadding: const EdgeInsets.only(left: 16, right: 8),
                title: const Text("ФОНД"),
                subtitle: const Text('НГМК'),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: AppIcons.x.svg(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'ГЛАВНАЯ',
                          style: TextStyle(
                            color: secondary500,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: AppIcons.layoutGrid.svg(),
                        onTap: () {
                          _onTap(context, 0);
                        },
                        title: const Text("Главная"),
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'ДОКУМЕНТЫ',
                          style: TextStyle(
                            color: secondary500,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: secondary500,
                          collapsedIconColor: secondary500,
                          leading: AppIcons.notes.svg(),
                          initiallyExpanded:
                              widget.navigationShell.currentIndex > 0 &&
                                  widget.navigationShell.currentIndex < 4,
                          title: const Text("Служебные записки"),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 1,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Входящие',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 2,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Исходящие',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 3,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Черновики',
                            ),
                          ],
                        ),
                      ),
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: secondary500,
                          collapsedIconColor: secondary500,
                          leading: AppIcons.request.svg(),
                          title: const Text("Запросы"),
                          initiallyExpanded:
                              widget.navigationShell.currentIndex > 3 &&
                                  widget.navigationShell.currentIndex < 7,
                          children: [
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 4,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Полученные',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 5,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Отправленные',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 6,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Черновики',
                            ),
                          ],
                        ),
                      ),
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: secondary500,
                          collapsedIconColor: secondary500,
                          leading: AppIcons.reportMoney.svg(),
                          title: const Text("Накладные"),
                          initiallyExpanded:
                              widget.navigationShell.currentIndex > 6 &&
                                  widget.navigationShell.currentIndex < 9,
                          children: [
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 7,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Входящие',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 8,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Исходящие',
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'СКЛАДЫ',
                          style: TextStyle(
                            color: secondary500,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: secondary500,
                          collapsedIconColor: secondary500,
                          leading: AppIcons.buildingWarehouse.svg(),
                          title: const Text("Базы складов"),
                          initiallyExpanded:
                              widget.navigationShell.currentIndex > 8 &&
                                  widget.navigationShell.currentIndex < 12,
                          children: [
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 9,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Мясной склад',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 10,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Овощной склад',
                            ),
                            DrawerTapIteam(
                              onTap: (index) {
                                _onTap(context, index);
                              },
                              index: 11,
                              currentIndex: widget.navigationShell.currentIndex,
                              title: 'Рисовый склад',
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _onTap(context, 12);
                        },
                        leading: AppIcons.kitchen.svg(),
                        title: const Text("Склад кухни"),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  context.read<AuthBloc>().add(LogOutEvent());
                },
                leading: const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(AppImages.banner),
                ),
                contentPadding: const EdgeInsets.only(left: 16, right: 8),
                title: const Text("Мухаммадамин Н."),
                subtitle: const Text('Начальник склада '),
              ),
            ],
          ),
        ),
      ),
      body: widget.navigationShell,
    );
  }
}

class DrawerTapIteam extends StatelessWidget {
  const DrawerTapIteam({
    super.key,
    required this.onTap,
    required this.index,
    required this.currentIndex,
    required this.title,
  });
  final Function(int index) onTap;
  final int index;
  final int currentIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        onTap(index);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 44,
          right: 12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: currentIndex == index
            ? BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0A090B).withValues(alpha: .07),
                    blurRadius: 4,
                    spreadRadius: -1,
                    offset: const Offset(0, 1.5),
                  )
                ],
              )
            : null,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: backgroundText,
          ),
        ),
      ),
    );
  }
}
