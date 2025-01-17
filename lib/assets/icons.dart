import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const chevronDown = "assets/icons/chevron-down.svg";
  static const chevronLeft = "assets/icons/chevron-left.svg";
  static const chevronRight = "assets/icons/chevron-right.svg";
  static const x = "assets/icons/x.svg";
  static const eyeOff = "assets/icons/eye-off.svg";
  static const bell = "assets/icons/bell.svg";
  static const users = "assets/icons/users.svg";
  static const trash = "assets/icons/trash.svg";
  static const share = "assets/icons/share.svg";
  static const notes = "assets/icons/notes.svg";
  static const squarePlus = "assets/icons/square-plus.svg";
  static const subtract = "assets/icons/subtract.svg";
  static const request = "assets/icons/request.svg";
  static const reportMoney = "assets/icons/report-money.svg";
  static const menu2 = "assets/icons/menu-2.svg";
  static const layoutGrid = "assets/icons/layout-grid.svg";
  static const kitchen = "assets/icons/kitchen.svg";
  static const frame = "assets/icons/frame.svg";
  static const fileSymlink = "assets/icons/file-symlink.svg";
  static const calendarMinus = "assets/icons/calendar-minus.svg";
  static const buildingWarehouse = "assets/icons/building-warehouse.svg";
  static const brandCodepen = "assets/icons/brand-codepen.svg";
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
