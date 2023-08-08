import 'package:flutter/material.dart';
import 'package:timer_xadrez/core/app_colors.dart';

class AppText {
  const AppText._();
  static const TextStyle body = TextStyle(
      fontSize: 16.0, color: AppColors.text, fontWeight: FontWeight.w700);
  static const TextStyle timerText =
      TextStyle(fontSize: 56.0, color: AppColors.text);
}
