import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';

class TextFormFieldCard extends StatelessWidget {
  const TextFormFieldCard({
    super.key,
    this.controller,
    this.maxLines,
    this.textInputType,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: textInputType,
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      validator: validator,
      style: const TextStyle(
          color: Colors.black,
        ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 7),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: myYellow),
        ),
      ),
    );
  }
}
