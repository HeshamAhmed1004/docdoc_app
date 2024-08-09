import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key, this.contentPadding, this.enabledBorder, this.focusedBorder, required this.hintText, this.hintStyle, this.fillColor, this.filled, this.isObscureText, this.suffixIcon, this.inputTextStyle,});
final EdgeInsetsGeometry? contentPadding;
final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Color? fillColor;
  final bool? filled;
  final bool? isObscureText ;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        isDense: true,
        contentPadding:contentPadding ??  EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder:enabledBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManger.lighterGray, width: 1.3),
        ),
        focusedBorder:focusedBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManger.mainBlue, width: 1.3),
        ),
        hintText: hintText,
        hintStyle:hintStyle ?? TextStyles.font14LightGrayRegular,
        fillColor: ColorsManger.moreLightGray,
        filled: true,
suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ??TextStyles.font14DarkBlueMedium,
    );
  }
}
