import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalog/widgets/widget_size_ext.dart';

import '../app_base/constants/colors.dart';
import '../app_base/constants/text_styles.dart';
import '../generated/assets/assets.gen.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final String errorLabel;
  final bool showError;
  final bool showPermanentError;
  final bool onlyShowErrorOnFocus;
  final Widget? customizeErrorWidget;
  final void Function(String) onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int wordsLimit;
  final int numberOfLines;
  final int? minLines;
  final bool readonly;

  final List<String>? autoFill;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final GestureTapCallback? onTap;

  final bool isImportant;

  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.hintText = "",
    this.errorLabel = "Something is wrong",
    this.showError = false,
    this.showPermanentError = false,
    this.onlyShowErrorOnFocus = false,
    this.customizeErrorWidget,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.wordsLimit = 0,
    this.numberOfLines = 1,
    this.minLines,
    this.readonly = false,
    this.autoFill,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.isImportant = false,
    this.focusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _effectiveFocusNode;

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode = widget.focusNode ?? FocusNode();
    _effectiveFocusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      _effectiveFocusNode.removeListener(_onFocusChange);
      if (oldWidget.focusNode == null) {
        _effectiveFocusNode.dispose();
      }

      _effectiveFocusNode = widget.focusNode ?? FocusNode();
      _effectiveFocusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChange);
    // Only dispose if we created it internally
    if (widget.focusNode == null) {
      _effectiveFocusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // show permanent error is not classified as error, is a description
    final bool hasError = widget.showError;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        if (widget.label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 1,
            children: [
              Text(widget.label!, style: AppTextStyles.labelSmall),
              if (widget.isImportant)
                Text(
                  '*',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.errorBase,
                  ),
                ),
            ],
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            boxShadow: widget.wordsLimit > 0
                ? []
                : [AppColors.regularShadowXSmall],
          ),
          child: TextFormField(
            onTap: widget.onTap,
            autofillHints: widget.autoFill,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readonly,
            canRequestFocus: !widget.readonly,
            controller: widget.controller,
            style: AppTextStyles.paragraphSmall.copyWith(
              color: widget.readonly
                  ? AppColors.textDisabled300
                  : AppColors.textStrong950,
            ),
            obscureText: widget.obscureText,
            obscuringCharacter: '·',
            maxLength: widget.wordsLimit == 0 ? null : widget.wordsLimit,
            maxLines: widget.numberOfLines,
            minLines: widget.minLines,
            cursorHeight: 16,
            focusNode: _effectiveFocusNode,
            onTapOutside: (event) {
              _effectiveFocusNode.unfocus();
            },
            decoration: InputDecoration(
              alignLabelWithHint: true,
              fillColor: widget.readonly
                  ? AppColors.bgWhite0
                  : AppColors.bgWhite0,
              filled: true,
              isDense: false,
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
              // labelText: widget.label,
              // labelStyle: AppTextStyles.labelSmall.copyWith(
              //   color: widget.readonly
              //       ? AppColors.textDisabled300
              //       : AppColors.textStrong950,
              // ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // floatingLabelAlignment: FloatingLabelAlignment.start,
              // floatingLabelStyle: AppTextStyles.labelSmall.copyWith(
              //   color: _effectiveFocusNode.hasFocus
              //       ? AppColors.primary
              //       : hasError
              //       ? AppColors.errorBase
              //       : AppColors.textSoft400,
              // ),
              hintText: widget.hintText,
              hintStyle: AppTextStyles.paragraphSmall.copyWith(
                color: AppColors.textSoft400,
              ),
              // error: _buildErrorWidget(),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: hasError
                      ? AppColors.errorBase
                      : AppColors.strokeSoft200,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: hasError ? AppColors.errorBase : AppColors.primary,
                  width: 1,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.errorBase, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.errorBase, width: 1),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: AppColors.strokeSoft200,
                  width: 1,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              enabled: !widget.readonly,
              suffixIcon: _buildSuffixIcon(hasError),
              suffixIconConstraints: BoxConstraints(maxHeight: 40),
              prefixIcon: _buildPrefixIcon(),
              prefixIconConstraints: BoxConstraints(maxHeight: 40),
            ),
            onChanged: widget.onChanged,
          ),
        ),
        if (_buildErrorWidget() != null) _buildErrorWidget()!,
      ],
    );
  }

  Widget? _buildErrorWidget() {
    if (widget.showError || widget.showPermanentError) {
      if ((widget.onlyShowErrorOnFocus && _effectiveFocusNode.hasFocus) ||
          !widget.onlyShowErrorOnFocus) {
        if (widget.customizeErrorWidget == null) {
          return Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                Assets.icons.informationFill.path,
                height: 16,
                width: 16,
                colorFilter: ColorFilter.mode(
                  widget.showError ? AppColors.errorBase : AppColors.textSub600,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                widget.errorLabel,
                style: AppTextStyles.paragraphXSmall.copyWith(
                  color: widget.showError
                      ? AppColors.errorBase
                      : AppColors.textSub600,
                ),
              ),
            ],
          );
        } else {
          return widget.customizeErrorWidget;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// dont simply change, if need multi icon need re-adjust
  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon == null) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 0.0),
      child: widget.prefixIcon!,
    );
  }

  /// dont simply change, if need multi icon need re-adjust
  Widget? _buildSuffixIcon(bool hasError) {
    final List<Widget> suffixChildren = [];

    // if (hasError) {
    //   suffixChildren.add(
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //       child: SvgPicture.asset(
    //         Assets.icons.informationFill.path,
    //         colorFilter: const ColorFilter.mode(
    //           AppColors.errorBase,
    //           BlendMode.srcIn,
    //         ),
    //         height: 20,
    //         width: 20,
    //       ),
    //     ),
    //   );
    // }

    if (widget.suffixIcon != null) {
      // if (hasError) {
      //   suffixChildren.add(const SizedBox(width: 8));
      // }
      suffixChildren.add(widget.suffixIcon!);
    }

    if (suffixChildren.isEmpty) {
      return null;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: suffixChildren,
    ).withPadding(const EdgeInsets.only(right: 10));
  }
}
