import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/filtres/filtre_page.dart';
import 'package:flutter/material.dart';

void myShowModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final height = MediaQuery.of(context).size.height;
      return Container(
        constraints: BoxConstraints(
          maxHeight: 0.8 * height,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: myGrisFonce22,
                    ),
                  ),
                  const SizedBox(
                    height: 02,
                  ),
                  Text(
                    "Filtre",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: FiltrePage(),
            ),
          ],
        ),
      );
    },
  );
}
