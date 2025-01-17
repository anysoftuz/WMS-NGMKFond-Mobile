import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;
  final EdgeInsetsGeometry? padding;

  const WTabBar({
    this.tabController,
    required this.tabs,
    super.key,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: whiteGrey,
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        padding: padding ?? const EdgeInsets.all(6),
        labelPadding: const EdgeInsets.all(12),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: -1,
              offset: const Offset(0, 1.5),
              color: const Color(0xFF0A090B).withValues(alpha: 0.07),
            ),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: black.withValues(alpha: 0.04)),
            borderRadius: BorderRadius.circular(20),
          ),
          color: white,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
        unselectedLabelColor: shuttleGrey,
        labelColor: black,
        tabs: tabs,
      ),
    );
  }
}
