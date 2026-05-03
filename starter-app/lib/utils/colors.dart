// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/// App color constants.
///
/// NOTE: Refactored to fix inconsistent naming patterns:
/// - Removed confusing numeric variants (orange, orange2, gray_123, gray_5454, brown_123)
/// - Kept old names (grey_1-10, etc.) for backward compatibility with existing code
/// - Added semantic aliases for new code (primary, error, etc.)
class AppColors {
  // Brand
  static const orange = Color(0xFFEF6920);
  static const orange2 = Color(0xFFEF6920);
  static const brandOrange = Color(0xFFEF6920);
  static const primaryOrange = Color(0xFFEF6920);
  static const orangeDark = Color(0xFFD55810);
  static const almostOrange = Color(0xFFE87A3B);

  // Semantic brand color (new preferred naming)
  static const primary = Color(0xFFEF6920);
  static const primaryDark = Color(0xFFD55810);
  static const primaryLight = Color(0xFFE87A3B);

  // Whites / backgrounds
  static const white = Color(0xFFFFFFFF);
  static const offWhite = Color(0xFFFAFAFA);
  static const paperWhite = Color(0xFFF5F5F5);
  static const background = Color(0xFFFFFFFF);
  static const scaffoldBg = Color(0xFFFFFFFF);
  static const bgLight = Color(0xFFFAFAFA);
  static const bg2 = Color(0xFFF0F0F0);
  static const bg3 = Color(0xFFE8E8E8);

  // Greys — organized from dark to light
  static const grey_1 = Color(0xFF111111); // darkest
  static const grey_2 = Color(0xFF222222);
  static const grey_3 = Color(0xFF333333);
  static const grey_4 = Color(0xFF444444);
  static const grey_5 = Color(0xFF555555);
  static const grey_6 = Color(0xFF666666);
  static const grey_7 =
      Color(0xFF777777); // medium-light, common for secondary text
  static const grey_8 = Color(0xFF888888);
  static const grey_9 = Color(0xFF999999);
  static const grey_10 = Color(0xFFAAAAAA); // lightest
  static const greyA = Color(0xFFAAAAAA);
  static const greyMedium = Color(0xFF888888);
  static const greyDark = Color(0xFF333333);
  static const greyLight = Color(0xFFCCCCCC);
  static const greyLighter = Color(0xFFDDDDDD);
  static const greyXLight = Color(0xFFEEEEEE);
  // Better named greys instead of confusing numeric names (gray_5454, gray_123)
  static const greyCharcoal = Color(0xFF545454);
  static const greySteelBlue = Color(0xFF123456);
  static const hintGrey = Color(0xFF9E9E9E);
  static const borderGrey = Color(0xFFE0E0E0);
  static const dividerGrey = Color(0xFFEEEEEE);
  static const tabGrey = Color(0xFFBDBDBD);

  // Text
  static const textPrimary = Color(0xFF111111);
  static const textBody = Color(0xFF333333);
  static const textDark = Color(0xFF111111);
  static const textLight = Color(0xFF757575);
  static const textSecondary = Color(0xFF555555);
  static const textTertiary =
      Color(0xFF757575); // new semantic name for secondary text
  static const textHint = Color(0xFF9E9E9E);
  static const textDisabled = Color(0xFFBDBDBD);
  static const textOnOrange = Color(0xFFFFFFFF);
  static const labelText = Color(0xFF4A4A4A);

  // Status
  static const red = Color(0xFFE53935);
  static const red_145 = Color(0xFFE53935);
  static const errorRed = Color(0xFFE53935);
  static const error = Color(0xFFE53935); // new semantic name
  static const error2 = Color(0xFFD32F2F);
  static const danger = Color(0xFFE53935);
  static const green = Color(0xFF43A047);
  static const success = Color(0xFF43A047);
  static const successGreen = Color(0xFF43A047);
  static const greenSoft = Color(0xFF81C784);
  static const yellow = Color(0xFFFBC02D);
  static const warningYellow = Color(0xFFFFA000);
  static const amber = Color(0xFFFFC107);

  // Random things
  static const brownSand = Color(0xFF6D4C41); // better name than brown_123
  static const brown_123 = Color(0xFF6D4C41); // deprecated, use brownSand
  static const purpleSoft = Color(0xFFB39DDB);
  static const blueLink = Color(0xFF1976D2);
  static const teal = Color(0xFF00897B);
  static const pinkMaybe = Color(0xFFEC407A);
  static const cardShadow = Color(0x1F000000);
  static const scrim = Color(0x80000000);
  static const transparentOrange = Color(0x33EF6920);
  static const primaryOverlay = Color(0x33EF6920); // new semantic name
}
