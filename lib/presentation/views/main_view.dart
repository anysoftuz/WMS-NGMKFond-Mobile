import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/assets/icons.dart';
import 'package:sklad/assets/images.dart';
import 'package:sklad/data/models/filter_model.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/presentation/widgets/w_button.dart';
import 'package:sklad/presentation/widgets/w_scale_animation.dart';
import 'package:sklad/utils/log_service.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void _onTap(BuildContext context, int index) {
    Log.i(index);

    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    Navigator.pop(context);
    switch (index) {
      case 1:
        context.read<HomeBloc>().add(GetReceivedEvent(
              model: FilterModel(docType: 'memo'),
            ));
        break;
      case 2:
        context.read<HomeBloc>().add(GetSentEvent(
              model: FilterModel(docType: 'memo'),
            ));
        break;
      case 3:
        context.read<HomeBloc>().add(GetDraftsEvent(
              model: FilterModel(docType: 'memo'),
            ));
        break;
      case 4:
        context.read<HomeBloc>().add(
            GetReceivedEvent(model: FilterModel(docType: 'simple_demand')));
        break;
      case 5:
        context
            .read<HomeBloc>()
            .add(GetSentEvent(model: FilterModel(docType: 'simple_demand')));
        break;
      case 6:
        context.read<HomeBloc>().add(GetDraftsEvent(model: FilterModel()));
        break;
      case 7:
        context.read<HomeBloc>().add(GetReceivedEvent(
              model: FilterModel(docType: 'invoice'),
            ));
        break;
      case 8:
        context
            .read<HomeBloc>()
            .add(GetSentEvent(model: FilterModel(docType: 'invoice')));
        break;
      default:
    }
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
          // WButton(
          //   onTap: () {
          //     context.push(AppRouteName.notification);
          //   },
          //   height: 52,
          //   width: 52,
          //   borderRadius: 20,
          //   color: whiteGrey,
          //   isDisabled: true,
          //   child: AppIcons.bell.svg(),
          // ),
          // const SizedBox(width: 12),
          WButton(
            onTap: () {
              context.push(AppRouteName.create).then(
                (value) {
                  if (context.mounted) {
                    context.read<HomeBloc>().add(GetRespondentsListEvent());
                  }
                },
              );
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
                      BaseIteam(widget: widget),
                    ],
                  ),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: CachedNetworkImageProvider(
                        state.userModel.user?.avatar ?? "",
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 16, right: 8),
                    title: Text(
                      "${state.userModel.user?.lastname ?? "Nomalum"} ${(state.userModel.user?.firstname ?? "Nomalum")[0]}.${(state.userModel.user?.patronymic ?? "Nomalum")[0]}",
                    ),
                    subtitle: Text(state.userModel.user?.position ?? 'Nomalum'),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: WScaleAnimation(
                  onTap: () {
                    context.read<AuthBloc>().add(LogOutEvent());
                  },
                  child: Row(
                    spacing: 4,
                    children: [
                      AppIcons.logout.svg(),
                      const Text(
                        'Выход',
                        style: TextStyle(
                          color: red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: widget.navigationShell,
    );
  }
}

class BaseIteam extends StatelessWidget {
  const BaseIteam({
    super.key,
    required this.widget,
  });

  final MainView widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: secondary500,
            collapsedIconColor: secondary500,
            leading: AppIcons.buildingWarehouse.svg(),
            title: const Text("Базы складов"),
            initiallyExpanded: widget.navigationShell.currentIndex > 8 &&
                widget.navigationShell.currentIndex < 12,
            children: List.generate(
              state.managementsBasesModel.managements.length,
              (index) => ExpansionTile(
                iconColor: secondary500,
                collapsedIconColor: secondary500,
                title: Text(
                  state.managementsBasesModel.managements[index].name,
                ),
                children: List.generate(
                  state.managementsBasesModel.managements[index].bases.length,
                  (index2) => WScaleAnimation(
                    onTap: () {
                      context.push(
                        AppRouteName.meatWarehouse,
                        extra: state.managementsBasesModel.managements[index]
                            .bases[index2],
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 24,
                        right: 12,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.managementsBasesModel.managements[index]
                                  .bases[index2].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: backgroundText,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: backgroundText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
