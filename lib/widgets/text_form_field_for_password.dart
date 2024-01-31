import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';


class TextFormFieldForPassword extends StatefulWidget {
  const TextFormFieldForPassword({
    super.key,
    required this.validator,
    required this.hintText,
    required this.controller,
  });
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController controller;
  @override
  State<TextFormFieldForPassword> createState() =>
      _TextFormFieldForPasswordState();
}

class _TextFormFieldForPasswordState extends State<TextFormFieldForPassword> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      validator: widget.validator,
      style: const TextStyle(
        color: myGrisFonce,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 7),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: myGrisFonceAA,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: myGrisFonceAA,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: isPasswordVisible
              ? const Icon(Icons.visibility_outlined)
              : const Icon(
                  Icons.visibility_off_outlined,
                ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: myOrange)),
      ),
    );
  }
}
