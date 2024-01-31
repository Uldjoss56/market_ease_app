import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  BoxDecoration decoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 0),
        blurRadius: 1,
        spreadRadius: 0.1,
        color: myGrisFonce55,
      ),
    ],
  );
  List<String> selectedCategoriesId = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Parlez nous un peu de vous",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Parlez nous un peu de vos secteurs d'activité. Votre boutique sera prete à l'emploi en quelques étapes",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "De quoi traite votre entreprise ?",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Choisissez une catégorie !",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Wrap(
                  children: List.generate(
                    myCategories.length,
                    (index) => InkWell(
                      onTap: () {
                        if (selectedCategoriesId
                            .contains(myCategories[index].id)) {
                          setState(() {
                            selectedCategoriesId.remove(myCategories[index].id);
                            decoration = const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0.1,
                                  color: myGrisFonce55,
                                ),
                              ],
                            );
                          });
                        } else {
                          setState(() {
                            selectedCategoriesId.add(myCategories[index].id);
                            decoration = const BoxDecoration(
                              color: myOrange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0.1,
                                  color: myGrisFonce55,
                                ),
                              ],
                            );
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: decoration,
                        width: 0.23 * width,
                        height: 0.15 * width,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                myCategories[index].img.toString(),
                                width: 40,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                myCategories[index].title,
                                style: selectedCategoriesId
                                        .contains(myCategories[index].id)
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          color: Colors.white,
                                        )
                                    : Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: myOrange,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18)))),
                    onPressed: () {},
                    child: Text(
                      "Etape suivante",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
