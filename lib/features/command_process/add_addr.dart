import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class AddAddr extends StatefulWidget {
  const AddAddr({
    super.key,
  });

  @override
  State<AddAddr> createState() => _AddAddrState();
}

class _AddAddrState extends State<AddAddr> {
  final _formKey = GlobalKey<FormState>();
  String? _currentCountry = "Bénin";
  String? _currentCity = "Cotonou";
  @override
  Widget build(BuildContext context) {
    List<String> country = ["Bénin", "Nigéria", "Congo"];
    List<String> city = ["Cotonou", "Ouidah", "Porto-Novo"];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Ajouter votre adresse",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pays",
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
                              DropdownButtonFormField(
                                value: _currentCountry,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: myOrange),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                ),
                                items: List.generate(
                                  country.length,
                                  (index) => DropdownMenuItem(
                                    value: country[index],
                                    child: Text(country[index]),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _currentCountry = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ville",
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
                              DropdownButtonFormField(
                                value: _currentCity,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: myOrange),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    )),
                                items: List.generate(
                                  city.length,
                                  (index) => DropdownMenuItem(
                                    value: city[index],
                                    child: Text(city[index]),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _currentCity = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Code postal",
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
                              TextFormField(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: myOrange),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: myOrange),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adresse",
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
                              TextFormField(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: myOrange),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom et prénoms",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: myOrange),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: myOrange),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Numéro de téléphone",
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
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField(
                                    value: _currentCountry,
                                    decoration: const InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: myOrange),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        )),
                                    items: List.generate(
                                      country.length,
                                      (index) => DropdownMenuItem(
                                        value: country[index],
                                        child: Text(country[index]),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _currentCountry = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: myOrange),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Localisation",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
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
                        SizedBox(
                          height: height * 0.025,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "1 article",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const Spacer(),
                            const Text(
                              "F 20000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
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
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const Spacer(),
                            const Text(
                              "F 20000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black.withOpacity(0.5)),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const Spacer(),
                            const Text(
                              "F 40000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.13,
                              vertical: height * 0.020,
                            ),
                            backgroundColor: myOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
