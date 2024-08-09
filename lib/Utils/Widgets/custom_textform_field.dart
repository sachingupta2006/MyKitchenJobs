import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hint,
      this.keyBoardType,
      this.validator,
      this.controller,
      this.maxLength,
      this.autoFocus = false,
      this.firstCaps = false,
      this.onChnaged,
      this.maxLine});
  final String? hint;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLine;
  final bool autoFocus;
  final bool firstCaps;
  final void Function(String)? onChnaged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLine == null ? 45.h : null,
      decoration: const BoxDecoration(color: AppColors.grey),
      child: TextFormField(
        maxLines: maxLine,
        onChanged: onChnaged,
        autofocus: autoFocus,
        maxLength: maxLength,
        controller: controller,
        textInputAction: TextInputAction.done,
        textCapitalization:
            firstCaps ? TextCapitalization.words : TextCapitalization.none,
        keyboardType: keyBoardType,
        style: TextStyle(
            color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: maxLine != null ? 10.h : 0, left: 15.w),
            counterText: '',
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: borderDeco(),
            errorBorder: borderDeco(),
            focusedBorder: borderDeco(),
            enabledBorder: borderDeco(),
            disabledBorder: borderDeco(),
            focusedErrorBorder: borderDeco()),
      ),
    );
  }

  InputBorder borderDeco() {
    return InputBorder.none;
  }
}
