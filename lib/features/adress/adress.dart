import 'package:e_com_app/widgets/location_input.dart';
import 'package:flutter/material.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LocationInput(),
    );
  }
}
