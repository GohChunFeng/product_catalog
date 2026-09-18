import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalog/app_base/constants/colors.dart';

///Used to display placeholder when the page content is empty
class AppEmptyPlaceholder extends StatelessWidget {
  final String? iconPath;
  final String? title;
  final String? desc;

  const AppEmptyPlaceholder({super.key, this.iconPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        if (iconPath != null)
          SvgPicture.asset(
            iconPath ?? '',
            width: 80,
            height: 80,
            colorFilter: ColorFilter.mode(
              AppColors.iconDisabled300,
              BlendMode.srcIn,
            ),
          ),
        if (title != null)
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textSoft400,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (desc != null)
          Text(
            desc ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSoft400,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
