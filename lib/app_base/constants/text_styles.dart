import 'package:flutter/material.dart';

import '../../generated/assets/fonts.gen.dart';
import 'colors.dart';

/// this is based on the the color from AlignUI

class AppTextStyles {
  AppTextStyles._();

  /// custom font
  // Inter
  static const label2XSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 10,
    letterSpacing: (48 * 0.00),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.6,
    color: AppColors.textStrong950,
  );

  /// according to this: https://github.com/rsms/inter/discussions/757 , InterDisplay is just Inter with opsz = 32
  /// letter spacing in figma using -1% probably means that it is -(fontSize * 0.01)
  /// default all use textStrong950 change with copyWith if needed

  // Inter display
  static const titleH1Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 56,
    letterSpacing: -(56 * 0.01),
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.15,
    color: AppColors.textStrong950,
  );

  // Inter display
  static const titleH2Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 48,
    letterSpacing: -(48 * 0.01),
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.17,
    color: AppColors.textStrong950,
  );

  // Inter display
  static const titleH3Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 40,
    letterSpacing: -(40 * 0.01),
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.2,
    color: AppColors.textStrong950,
  );

  // Inter display
  static const titleH4Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 32,
    letterSpacing: -(32 * 0.005),
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.25,
    color: AppColors.textStrong950,
  );

  // Inter display
  static const titleH5Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 24,
    letterSpacing: 0,
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter display
  static const titleH6Title = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 20,
    letterSpacing: 0,
    fontVariations: [FontVariation('wght', 500), FontVariation('opsz', 32)],
    height: 1.4,
    color: AppColors.textStrong950,
  );

  // Inter
  static const labelXLarge = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 24,
    letterSpacing: -(24 * 0.015),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const labelLarge = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    letterSpacing: -(18 * 0.015),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const labelMedium = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    letterSpacing: -(16 * 0.011),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.5,
    color: AppColors.textStrong950,
  );

  // Inter
  static const labelSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    letterSpacing: -(14 * 0.006),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.42,
    color: AppColors.textStrong950,
  );

  // Inter
  static const labelXSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    letterSpacing: 0,
    fontVariations: [FontVariation('wght', 500)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const paragraphXLarge = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 24,
    letterSpacing: -(24 * 0.015),
    fontVariations: [FontVariation('wght', 400)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const paragraphLarge = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    letterSpacing: -(18 * 0.015),
    fontVariations: [FontVariation('wght', 400)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const paragraphMedium = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    letterSpacing: -(16 * 0.011),
    fontVariations: [FontVariation('wght', 400)],
    height: 1.5,
    color: AppColors.textStrong950,
  );

  // Inter
  static const paragraphSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    letterSpacing: -(14 * 0.006),
    fontVariations: [FontVariation('wght', 400)],
    height: 1.42,
    color: AppColors.textStrong950,
  );

  // Inter
  static const paragraphXSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    letterSpacing: 0,
    fontVariations: [FontVariation('wght', 400)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const subHeadingMedium = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    letterSpacing: (16 * 0.06),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.5,
    color: AppColors.textStrong950,
  );

  // Inter
  static const subHeadingSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    letterSpacing: (14 * 0.06),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.42,
    color: AppColors.textStrong950,
  );

  // Inter
  static const subHeadingXSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    letterSpacing: (12 * 0.04),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.33,
    color: AppColors.textStrong950,
  );

  // Inter
  static const subHeading2XSmall = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 11,
    letterSpacing: (11 * 0.02),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.09,
    color: AppColors.textStrong950,
  );

  // Inter
  static const docsLabel = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    letterSpacing: -(18 * 0.015),
    fontVariations: [FontVariation('wght', 500)],
    height: 1.77,
    color: AppColors.textStrong950,
  );

  // Inter
  static const docsParagraph = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    letterSpacing: -(18 * 0.015),
    fontVariations: [FontVariation('wght', 400)],
    height: 1.77,
    color: AppColors.textStrong950,
  );
}
