import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../app_base/constants/colors.dart';

class AppSkeletonizer extends StatelessWidget {
  final Widget child;
  const AppSkeletonizer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: AppColors.neutral200,
        highlightColor: AppColors.neutral200,
        duration: Duration(seconds: 2),
      ),
      child: child,
    );
  }
}
