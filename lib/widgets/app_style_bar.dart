import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog/widgets/widget_size_ext.dart';

import '../../../generated/assets/assets.gen.dart';
import '../app_base/constants/colors.dart';
import '../app_base/constants/text_styles.dart';
import 'app_search_text_field.dart';

class AppStyleBar {
  AppStyleBar._();

  static AppBar buildCommonAppBar(
    BuildContext context, {
    double? appBarHeight,
    bool? showLeading,
    double? leadingWidth,
    Widget? customLeading,
    bool? centerTitle,
    Widget? title,
    List<Widget>? actions,
  }) {
    appBarHeight ??= 48;
    showLeading ??= false;
    leadingWidth ??= 40; // padding left 16 + icon size 24
    centerTitle ??= false;

    Widget? leading;
    if (showLeading) {
      leading =
          customLeading ??
          buildAppbarButton(
            context,
            iconPath: Assets.icons.arrowLeftSLine.path,
            color: AppColors.iconSub600,
            onPressed: () {
              context.pop();
            },
          );
    }

    return AppBar(
      toolbarHeight: appBarHeight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth,
      leading: leading != null
          ? Container(alignment: Alignment.centerRight, child: leading)
          : null,
      centerTitle: centerTitle,
      titleSpacing: showLeading ? 8 : 16,
      title: title,
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: 16),
    );
  }

  static AppBar buildHeaderTitleAppbar(
    BuildContext context, {
    double? appBarHeight,
    bool? showLeading,
    double? leadingWidth,
    Widget? customLeading,
    String? title,
    Widget? titleWidget,
    List<Widget>? actions,
  }) {
    titleWidget ??= title != null
        ? Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelLarge,
          )
        : null;

    return buildCommonAppBar(
      context,
      appBarHeight: appBarHeight,
      showLeading: showLeading,
      leadingWidth: leadingWidth,
      customLeading: customLeading,
      title: titleWidget,
      actions: actions,
    );
  }

  static AppBar buildCenterTitleAppBar(
    BuildContext context, {
    double? appBarHeight,
    bool? showLeading,
    double? leadingWidth,
    Widget? customLeading,
    String? title,
    Widget? customTitle,
    List<Widget>? actions,
  }) {
    customTitle ??= title != null
        ? Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.labelLarge,
          )
        : null;

    return buildCommonAppBar(
      context,
      appBarHeight: appBarHeight,
      showLeading: showLeading,
      leadingWidth: leadingWidth,
      customLeading: customLeading,
      centerTitle: true,
      title: customTitle,
      actions: actions,
    );
  }

  static AppBar buildSearchAppBar(
    BuildContext context, {
    double? appBarHeight,
    bool? showLeading,
    double? leadingWidth,
    Widget? customLeading,
    List<Widget>? actions,
    required TextEditingController searchController,
    required Function(String) onChange,
  }) {
    Widget searchBar = AppSearchTextField(
      searchTextController: searchController,
      onChange: onChange,
    ).withPadding(const EdgeInsets.only(right: 8));

    return buildCommonAppBar(
      context,
      appBarHeight: appBarHeight,
      showLeading: showLeading,
      leadingWidth: leadingWidth,
      customLeading: customLeading,
      centerTitle: true,
      title: searchBar,
      actions: actions,
    );
  }

  static AppBar buildEmptyAppBar(
    BuildContext context, {
    SystemUiOverlayStyle? systemOverlayStyle,
    Brightness contentBrightness = Brightness.dark,
  }) {
    return buildCommonAppBar(context, appBarHeight: 0);
  }

  static Widget buildAppbarButton(
    BuildContext context, {
    required String iconPath,
    required VoidCallback onPressed,
    double width = 24,
    double height = 24,
    Color? color = AppColors.iconSub600,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        icon: SvgPicture.asset(
          iconPath,
          colorFilter: color != null
              ? ColorFilter.mode(color, BlendMode.srcIn)
              : null,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
