import 'package:e_com_app/const.dart';
import 'package:e_com_app/features/command/payment.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalController = TextEditingController();
  final _numPrefixController = TextEditingController();
  final _numeroController = TextEditingController();
  final _fullnameController = TextEditingController();

  bool isTapStreet = false;
  bool isTapCity = false;
  bool isTapCountry = false;
  bool isTapCountryCode = false;

  List<String> countries = [
    "Bénin",
    "Togo",
    "Côte d'ivoire",
    "Mali",
    "Niger",
    "RDC",
  ];
  List<String> countriesCode = [
    "+229",
    "+228",
    "+225",
    "+223",
    "+223",
    "+243",
  ];
  List<String> countrieSuggestion = [
    "Bénin",
    "Togo",
    "Côte d'ivoire",
    "Mali",
    "Niger",
    "RDC",
  ];
  List<String> countriesCodeSuggestion = [
    "+229",
    "+228",
    "+225",
    "+223",
    "+223",
    "+243",
  ];
  List<String> cities = [
    "Cotonou",
    "Ouidah",
    "Porto-Novo",
  ];
  List<String> citySuggestion = [
    "Cotonou",
    "Ouidah",
    "Porto-Novo",
  ];
  List<String> streets = [
    "Sikècodji, rue 456, allée 82, maison 201",
    "Sikècodji, rue 456, allée 82, maison 201",
    "Sikècodji, rue 456, allée 82, maison 201",
  ];
  List<String> streetSuggestion = [
    "Sikècodji, rue 456, allée 82, maison 201",
    "Sikècodji, rue 456, allée 82, maison 201",
    "Sikècodji, rue 456, allée 82, maison 201",
  ];
  @override
  Widget build(BuildContext context) {
    _numPrefixController.text = "+229";
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
          'Ajouter votre adresse',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
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
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pays *",
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
                                width: (width / 2) - 20,
                                child: Container(
                                  color: myWhite,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _countryController,
                                        onTap: () {
                                          setState(() {
                                            isTapCountry = true;
                                            isTapCity = false;
                                            isTapStreet = false;
                                            isTapCountryCode = false;
                                          });
                                        },
                                        onEditingComplete: () {
                                          setState(() {
                                            isTapCountry = false;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            countrieSuggestion =
                                                countries.where(
                                              (country) {
                                                final suggestion = country
                                                    .toLowerCase()
                                                    .contains(
                                                      value.toLowerCase(),
                                                    );
                                                return suggestion;
                                              },
                                            ).toList();
                                          });
                                        },
                                        style: const TextStyle(
                                          color: myGrisFonce,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Ex: Bénin",
                                          contentPadding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isTapCountry = !isTapCountry;
                                                isTapCity = false;
                                                isTapStreet = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange55,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      if (countrieSuggestion.isNotEmpty &&
                                          isTapCountry)
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            color: myWhite,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: myOrange,
                                            ),
                                          ),
                                          child: ListView.builder(
                                            itemCount:
                                                countrieSuggestion.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      countrieSuggestion[index],
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _countryController.text =
                                                          countrieSuggestion[
                                                              index];
                                                      setState(() {
                                                        countrieSuggestion = [];
                                                      });
                                                    },
                                                  ),
                                                  if (index !=
                                                      countrieSuggestion
                                                              .length -
                                                          1)
                                                    Container(
                                                      color: myGrisFonce22,
                                                      height: 1,
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ville *",
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
                                width: (width / 2) - 20,
                                child: Container(
                                  color: myWhite,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _cityController,
                                        onTap: () {
                                          setState(() {
                                            isTapCity = true;
                                            isTapCountry = false;
                                            isTapStreet = false;
                                            isTapCountryCode = false;
                                          });
                                        },
                                        onEditingComplete: () {
                                          setState(() {
                                            isTapCity = false;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            isTapCity = true;
                                            citySuggestion = cities.where(
                                              (street) {
                                                final suggestion = street
                                                    .toLowerCase()
                                                    .contains(
                                                      value.toLowerCase(),
                                                    );
                                                return suggestion;
                                              },
                                            ).toList();
                                          });
                                        },
                                        style: const TextStyle(
                                          color: myGrisFonce,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Ex: Cotonou",
                                          contentPadding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isTapCity = !isTapCity;
                                                isTapCountry = false;
                                                isTapStreet = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange55,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (citySuggestion.isNotEmpty &&
                                          isTapCity)
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            color: myWhite,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: myOrange,
                                            ),
                                          ),
                                          child: ListView.builder(
                                            padding: const EdgeInsets.all(0),
                                            itemCount: citySuggestion.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      citySuggestion[index],
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _cityController.text =
                                                          citySuggestion[index];
                                                      setState(() {
                                                        citySuggestion = [];
                                                      });
                                                    },
                                                  ),
                                                  if (index !=
                                                      citySuggestion.length - 1)
                                                    Container(
                                                      color: myGrisFonce22,
                                                      height: 1,
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Code postal",
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
                                width: width / 4,
                                child: TextFormField(
                                  controller: _postalController,
                                  style: const TextStyle(
                                    color: myGrisFonce,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isTapCity = false;
                                      isTapCountry = false;
                                      isTapStreet = false;
                                      isTapCountryCode = false;
                                    });
                                  },
                                  decoration: InputDecoration(
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
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Adresse *",
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
                                width: (3 * width / 4) - 40,
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _streetController,
                                        onTap: () {
                                          setState(() {
                                            isTapStreet = true;
                                            isTapCity = false;
                                            isTapCountry = false;
                                            isTapCountryCode = false;
                                          });
                                        },
                                        onEditingComplete: () {
                                          setState(() {
                                            isTapStreet = false;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              isTapStreet = true;
                                              streetSuggestion = streets.where(
                                                (street) {
                                                  final suggestion = street
                                                      .toLowerCase()
                                                      .contains(
                                                        value.toLowerCase(),
                                                      );
                                                  return suggestion;
                                                },
                                              ).toList();
                                            },
                                          );
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Ex: Sikècodji, rue 456,"
                                              " allée 82, maison 201",
                                          contentPadding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isTapStreet = !isTapStreet;
                                                isTapCity = false;
                                                isTapCountry = false;
                                              });
                                            },
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange55,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: myGrisFonce,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (streetSuggestion.isNotEmpty &&
                                          isTapStreet)
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: myOrange,
                                            ),
                                          ),
                                          child: ListView.builder(
                                            padding: const EdgeInsets.all(0),
                                            itemCount: streetSuggestion.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      streetSuggestion[index],
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _streetController.text =
                                                          streetSuggestion[
                                                              index];
                                                      setState(() {
                                                        streetSuggestion = [];
                                                      });
                                                    },
                                                  ),
                                                  if (index !=
                                                      streetSuggestion.length -
                                                          1)
                                                    Container(
                                                      color: myGrisFonce22,
                                                      height: 1,
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nom & prénom(s)",
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
                              controller: _fullnameController,
                              style: const TextStyle(
                                color: myGrisFonce,
                              ),
                              onTap: () {
                                setState(() {
                                  isTapStreet = false;
                                  isTapCity = false;
                                  isTapCountry = false;
                                  isTapCountryCode = false;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Ex: AGBASSOU Assou Gorges",
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
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Numéro de téléphone *",
                            style: TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width / 4,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _numPrefixController,
                                        onTap: () {
                                          setState(() {
                                            isTapStreet = false;
                                            isTapCity = false;
                                            isTapCountry = false;
                                            isTapCountryCode = true;
                                          });
                                        },
                                        onEditingComplete: () {
                                          setState(() {
                                            isTapCountryCode = false;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              isTapCountryCode = true;
                                              countriesCodeSuggestion =
                                                  countriesCode.where(
                                                (countryCode) {
                                                  final suggestion = countryCode
                                                      .toLowerCase()
                                                      .contains(
                                                        value.toLowerCase(),
                                                      );
                                                  return suggestion;
                                                },
                                              ).toList();
                                            },
                                          );
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isTapCountryCode =
                                                    !isTapCountryCode;
                                                isTapStreet = false;
                                                isTapCity = false;
                                                isTapCountry = false;
                                              });
                                            },
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: myOrange55,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: myOrange,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: myGrisFonce,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      if (countriesCodeSuggestion.isNotEmpty &&
                                          isTapCountryCode)
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: myOrange,
                                            ),
                                          ),
                                          child: ListView.builder(
                                            padding: const EdgeInsets.all(0),
                                            itemCount:
                                                countriesCodeSuggestion.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      countriesCodeSuggestion[
                                                          index],
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _numPrefixController
                                                              .text =
                                                          countriesCode[index];
                                                      setState(() {
                                                        countriesCodeSuggestion =
                                                            [];
                                                      });
                                                    },
                                                  ),
                                                  if (index !=
                                                      countriesCodeSuggestion
                                                              .length -
                                                          1)
                                                    Container(
                                                      color: myGrisFonce22,
                                                      height: 1,
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: (3 * width / 4) - 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _numeroController,
                                          style: const TextStyle(
                                            color: myGrisFonce,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              isTapCity = false;
                                              isTapCountry = false;
                                              isTapStreet = false;
                                              isTapCountryCode = false;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Ex: 64548989",
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                color: myOrange,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                color: myOrange55,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                color: myOrange,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Localisation",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: const Text("Maison"),
                            leading: Image.asset("assets/casque.png"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "dndnndndndnndndndndn",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "Cotonou",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            decoration: const BoxDecoration(
              color: myWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1),
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  color: myGrisFonce22,
                ),
              ],
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "1 article",
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
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
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
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
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Payment(),
                        ),
                      );
                    },
                    child: Text(
                      "Poursuivre la commande",
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
        ],
      ),
    );
  }
}
