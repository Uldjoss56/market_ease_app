import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
 bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return isEmpty
        ? Center(
            child: Column(
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    "assets/boite_grise.png",
                    width: 100,
                  ),
                ),
                Text(
                  "Ajoutez un produit",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  width: width * 0.6,
                  child: Text(
                    "Ajoutez des produits à votre boutique pour dynamiser votre chiffre d'affaire et booster vos ventes",textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                  ),
                )
              ],
            ),
          )
        : const SizedBox();
  }

}