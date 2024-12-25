import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.maxLine = 1,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.validate,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onFieldSubmitted,
    //this.obscuringCharacter,
    required this.keyboardType,
    required this.controller,
  });
  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLine;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String)? onFieldSubmitted;
  //final String? obscuringCharacter;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      cursorColor: Colors.grey,
      enabled: true,
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLine,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      inputFormatters: const [],
      validator: validate,
      obscureText: obscureText!,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxWidth: width / 1,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        focusColor: AppColor.kGrey1,
        hoverColor: AppColor.kGrey2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if(states.contains(WidgetState.focused)) {
            return AppColor.kPrimaryColor1;
          } if(states.contains(WidgetState.error)) {
            return Colors.red;
          }
          return AppColor.kText3;
        }),
        suffixIconColor: AppColor.kText3,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: height / 42,
          horizontal: height / 42,
        ),
        hintStyle: TextStyle(
          color: AppColor.kText3,
          fontSize: width / 21.4,
          fontWeight: FontWeight.w400,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(AppColor.kPrimaryColor1),
        errorBorder: buildBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: color ?? AppColor.kText3,
      ),
    );
  }
}