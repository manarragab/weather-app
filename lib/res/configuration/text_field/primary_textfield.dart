import 'package:weather_app/res/configuration/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../color.dart';

class PrimaryTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final bool? multiLines;
  final TextInputAction? textInputAction;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double leftOrRightPadding;
  final int noOfLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;

  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const PrimaryTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.onTap,
    this.focusedBorder,
    this.noOfLines = 10,
    this.enabledBorder,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.multiLines = false,
    this.leftOrRightPadding = 20,
    this.onChanged,
    this.textInputAction = TextInputAction.none,
    this.maxLength,
    this.focusNode,
    this.inputFormatters,
    this.borderColor,
    this.color,
    this.textColor,
    this.hintColor,
  }) : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  Color borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    Color color = widget.color ?? HexColor.fromHex("#F8F8F8");
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        if (widget.focusNode!.hasFocus) {
          color = Colors.white;
          borderColor = CustomColors.accent;
        } else {
          color = HexColor.fromHex("#F8F8F8");
          borderColor = Colors.transparent;
        }
        setState(() {});
      });
    }

    TextStyle hintStyle = TFonts.style(
        color: widget.hintColor ?? CustomColors.grey,
        fontSize: 14.sp,
        fontWeight: TFontWights.bold);
    TextStyle style = TFonts.style(
        color: widget.textColor ?? CustomColors.primary,
        fontSize: 14.sp,
        fontWeight: TFontWights.bold);
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      maxLines: widget.multiLines! ? widget.noOfLines : 1,
      cursorColor: CustomColors.fontColor,
      style: style,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap ?? () {},
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,

        // borderRadius: BorderRadius.all(Radius.circular(10.h)),
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: borderColor)),
        counter: const Offstage(),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(
                  right: Get.locale == const Locale("en") ? 8.w : 0.0,
                  left: Get.locale == const Locale("ar") ? 8.w : 0.0,
                ),
                child: widget.prefixIcon,
              )
            : null,
        focusColor: CustomColors.primary,
        prefixIconConstraints: BoxConstraints(
          minWidth: 25.w,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 25.w,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: CustomColors.accent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: widget.borderColor ?? Colors.transparent)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: CustomColors.primary)),
        hoverColor: CustomColors.primary,
        hintText: widget.hintText ?? "",
        hintStyle: hintStyle,
        errorBorder: InputBorder.none,
        errorStyle: TFonts.style(
          color: CustomColors.red,
          fontSize: 12.sp,
          fontWeight: TFontWights.bold,
        ),

        contentPadding: EdgeInsetsDirectional.only(
          top: 15.h,
          bottom: 15.h,
          start: widget.leftOrRightPadding.h,
          end: widget.leftOrRightPadding.h,
        ),
      ),
      validator: widget.validator ??
          (String? value) {
            return null;
          },
    );
  }
}
