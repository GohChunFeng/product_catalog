import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalog/widgets/widget_size_ext.dart';

import '../app_base/constants/colors.dart';
import '../generated/assets/assets.gen.dart';
import 'app_text_field.dart';

class AppSearchTextField extends StatelessWidget {
  final TextEditingController searchTextController;
  final VoidCallback? onClear;
  final void Function(String) onChange;

  const AppSearchTextField({
    super.key,
    required this.searchTextController,
    this.onClear,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: "Search",
      prefixIcon: SvgPicture.asset(
        Assets.icons.searchLine.path,
        colorFilter: ColorFilter.mode(AppColors.iconSub600, BlendMode.srcIn),
        width: 20,
        height: 20,
      ),
      suffixIcon: ValueListenableBuilder<TextEditingValue>(
        valueListenable: searchTextController,
        builder: (context, value, child) {
          if (value.text.isNotEmpty) {
            return IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                searchTextController.clear();
                if (onClear != null) {
                  onClear!();
                }
              },
              icon: SvgPicture.asset(
                Assets.icons.closeLine.path,
                colorFilter: ColorFilter.mode(
                  AppColors.iconSub600,
                  BlendMode.srcIn,
                ),
                width: 20,
                height: 20,
              ),
            ).withSize(height: 20, width: 20);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      controller: searchTextController,
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
