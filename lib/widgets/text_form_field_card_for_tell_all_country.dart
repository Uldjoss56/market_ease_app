import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/country_data.dart';
import 'package:flutter/material.dart';

class TextFormFieldCardForTellAllCountry extends StatefulWidget {
  const TextFormFieldCardForTellAllCountry({
    super.key,
    this.controller,
    this.maxLines,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.hintText,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final int? maxLines;
  final bool obscureText;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? hintText;
  final Widget? suffixIcon;

  @override
  State<TextFormFieldCardForTellAllCountry> createState() =>
      _TextFormFieldCardForTellAllCountryState();
}

class _TextFormFieldCardForTellAllCountryState
    extends State<TextFormFieldCardForTellAllCountry> {
  String currentCountryCode = '+229';
  String pathToCurrentCountryFlag = 'assets/flag/benin_flag.jpg';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Téléphone invalide";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      style: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                pathToCurrentCountryFlag,
                width: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                currentCountryCode,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: myBackground,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      country.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentCountryCode =
                                    country[index]['indicatif'].toString();
                                pathToCurrentCountryFlag =
                                    country[index]['drapeau'].toString();
                                Navigator.pop(context);
                              });
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "${country[index]['drapeau']}"),
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${country[index]['nom']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    Text(
                                      "${country[index]['indicatif']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        suffixIcon: widget.suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: myOrange55),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: myOrange),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 7),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: myOrange),
        ),
      ),
    );
  }
}
