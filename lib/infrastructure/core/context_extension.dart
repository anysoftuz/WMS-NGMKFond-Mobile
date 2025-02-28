import 'package:flutter/material.dart';
import 'package:sklad/assets/themes/theme_colors.dart';



extension BuildContextExt on BuildContext {
  AppThemeColor get color => Theme.of(this).extension<AppThemeColor>()!;
}
