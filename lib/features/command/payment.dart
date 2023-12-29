import 'package:e_com_app/const.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _numeroPaymentController = TextEditingController();

  bool isSelectedMoov = true;
  bool isSelectedMTN = false;

  bool remainderPaymentDatas = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: myWhite,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Méthode de payement',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mode de paiement",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedMoov = true;
                                  isSelectedMTN = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: myWhite,
                                  boxShadow: isSelectedMoov
                                      ? [
                                          const BoxShadow(
                                            color: myOrange55,
                                            offset: Offset(0, 0),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          ),
                                        ]
                                      : [],
                                  border: Border.all(
                                    color: isSelectedMoov
                                        ? myOrange55
                                        : myGrisFonce55,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.amber,
                                ),
                                child: Image.asset(
                                  "assets/moov0africa_logo.png",
                                  width: width / 4,
                                  height: width / 6,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedMTN = true;
                                  isSelectedMoov = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: myWhite,
                                  boxShadow: isSelectedMTN
                                      ? [
                                          const BoxShadow(
                                            color: myOrange55,
                                            offset: Offset(0, 0),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          ),
                                        ]
                                      : [],
                                  border: Border.all(
                                    color: isSelectedMTN
                                        ? myOrange55
                                        : myGrisFonce55,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.amber,
                                ),
                                child: Image.asset(
                                  "assets/mtn_logo.png",
                                  width: width / 4,
                                  height: width / 6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Numéro de paiement *",
                          style: TextStyle(
                            color: myGrisFonce,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: width - 30,
                          child: TextFormField(
                            controller: _numeroPaymentController,
                            style: const TextStyle(
                              color: myGrisFonce,
                            ),
                            decoration: InputDecoration(
                              hintText: "Ex: 22964548989",
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: myOrange,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: myOrange55,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: myOrange,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: remainderPaymentDatas,
                          checkColor: myWhite,
                          activeColor: myOrange,
                          side: const BorderSide(
                            color: myOrange,
                            width: 2,
                          ),
                          onChanged: (value) {
                            setState(() {
                              remainderPaymentDatas = value!;
                            });
                          },
                        ),
                        const Text(
                          "Enregistrer les informations de payements",
                          style: TextStyle(
                            color: myGrisFonce,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "1 article",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        const Spacer(),
                        const Text(
                          "F 20000",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Livraison",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        const Spacer(),
                        const Text(
                          "F 20000",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black.withOpacity(0.5)),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        const Spacer(),
                        const Text(
                          "F 40000",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.13,
                          vertical: 10,
                        ),
                        backgroundColor: myOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        /*
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                        */
                      },
                      child: Text(
                        "Confirmer la commande",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
