import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatelessWidget {
  const CustomReactiveTextField({
    Key? key,
    required this.formController,
    required this.hint,
    this.padding,
    this.maxLine,
    required this.validation,
    this.textAction,
    this.onSubmit,
  }) : super(key: key);
  final String formController;
  final String hint;
  final EdgeInsetsGeometry? padding;
  final int? maxLine;
  final Map<String, String Function(Object)> validation;
  final TextInputAction? textAction;
  final void Function(FormControl<Object?>)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      onSubmitted: onSubmit ?? (control) {},
      textInputAction: textAction ?? TextInputAction.next,
      validationMessages: validation,
      formControlName: formController,
      decoration: InputDecoration(
        contentPadding: padding ?? const EdgeInsets.all(20),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none),
        fillColor: AppColors.milkWhite,
      ),
      maxLines: maxLine ?? 1,
      minLines: 1,
    );
  }
}
