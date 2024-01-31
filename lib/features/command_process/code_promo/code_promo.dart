
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/command/address_page.dart';
import 'package:flutter/material.dart';

class CodePromo extends StatefulWidget {
  const CodePromo({super.key});

  @override
  State<CodePromo> createState() => _CodePromoState();
}

class _CodePromoState extends State<CodePromo> {
  List<bool>? itemSelections = List.generate(
    5,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Code promo",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      const Card(
                        surfaceTintColor: myWhite,
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: myOrange,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.sell_rounded,
                                color: myWhite,
                                size: 16,
                              ),
                            ),
                          ),
                          title: Text(
                            "Black friday",
                            style: TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "Obtenez 40% de réduction sur tous"
                            " les produit de mode et de beauté",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 10,
                        width: 15,
                        height: 15,
                        child: Checkbox(
                          value: itemSelections![index],
                          checkColor: myWhite,
                          activeColor: myYellow,
                          onChanged: (value) {
                            setState(() {
                              itemSelections!.setAll(
                                0,
                                List.generate(5, (index) => false),
                              );
                              itemSelections![index] = value!;
                            });
                          },
                          shape: const CircleBorder(),
                          side: const BorderSide(
                            color: myYellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: itemSelections!.every((element) => !element)
                        ? null
                        : () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddressPage(),
                              ),
                            );
                          },
                    child: Text(
                      "Appliquer",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
