/*

import 'package:flutter/material.dart';

import '../global_features/theme_manager.dart';

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final FocusNode? focusNode;
  final double leftOrRightPadding;
  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.enabledBorder,
    this.focusedBorder,
    this.focusNode,
    this.validator,
    this.leftOrRightPadding = 0.0,
    this.onFieldSubmitted,
    this.title,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: isDarkMoodEnabled() ? ColorManager.white : ColorManager.fontColor,
      fontFamily: FontConstants.fontFamily,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          widget.title ?? "",
          color: isDarkMoodEnabled() ? null : ColorManager.fontColor,
        ),
        SizedBox(height: 7.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: isDarkMoodEnabled()
                ? ColorManager.transparent
                : ColorManager.white,
          ),
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            cursorColor: ColorManager.fontColor,
            style: style,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !visiblePassword,
            onFieldSubmitted: widget.onFieldSubmitted ?? (v) {},
            decoration: InputDecoration(
              focusColor: ColorManager.primary,
              hoverColor: ColorManager.primary,
              hintStyle: style,
              focusedBorder: widget.focusedBorder,
              enabledBorder: widget.enabledBorder,
              contentPadding: EdgeInsets.only(
                top: Get.locale != const Locale("ar") ? 12.h : 18.h,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  right: Get.locale != const Locale("ar")
                      ? 8.w
                      : widget.leftOrRightPadding.w,
                  left: Get.locale == const Locale("ar")
                      ? 8.w
                      : widget.leftOrRightPadding.w,
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: (widget.focusNode != null)
                      ? widget.focusNode!.hasFocus
                          ? (isDarkMoodEnabled()
                              ? ColorManager.accent
                              : ColorManager.primary)
                          : ColorManager.grey
                      : ColorManager.grey,
                  size: 23.w,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 25,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visiblePassword = !visiblePassword;
                  });
                },
                icon: visiblePassword
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: (widget.focusNode != null)
                            ? widget.focusNode!.hasFocus
                                ? (isDarkMoodEnabled()
                                    ? ColorManager.accent
                                    : ColorManager.primary)
                                : ColorManager.grey
                            : ColorManager.grey,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: (widget.focusNode != null)
                            ? widget.focusNode!.hasFocus
                                ? (isDarkMoodEnabled()
                                    ? ColorManager.accent
                                    : ColorManager.primary)
                                : ColorManager.grey
                            : ColorManager.grey,
                      ),
              ),
              hintText: widget.hintText!.isNotEmpty ? widget.hintText!.tr : '',
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
*/
