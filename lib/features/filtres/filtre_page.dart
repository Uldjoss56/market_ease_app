import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:flutter/material.dart';

class FiltrePage extends StatefulWidget {
  const FiltrePage({super.key});

  @override
  State<FiltrePage> createState() => _FiltrePageState();
}

class _FiltrePageState extends State<FiltrePage> {
  int selected = 0;
  RangeValues _rangeValues = const RangeValues(1, 100);
  bool? _selectedPrice = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Catégories",
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            Container(
              width: 90,
              height: 2,
              decoration: const BoxDecoration(
                color: myOrange,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 8.0,
          children: List.generate(
            myCategories.length,
            (index) => selected == index
                ? ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    label: Text(
                      myCategories[index].title,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    icon: Image.asset(
                            myCategories[index].img.toString(),
                            width: 20,
                          ),
                  )
                : OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() => selected = index);
                    },
                    icon: Image.asset(
                            myCategories[index].img.toString(),
                            width: 20,
                          ),
                    label: Text(myCategories[index].title),
                  ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Sous catégorie",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            10,
            (index) => CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/casque.png',
                width: 25,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Prix",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        ),
        RangeSlider(
          labels: RangeLabels(
            '${_rangeValues.start.toInt()}',
            '${_rangeValues.end.toInt()}',
          ),
          activeColor: myOrange,
          inactiveColor: Colors.grey,
          divisions: 10000,
          min: 1,
          max: 100000,
          values: _rangeValues,
          onChanged: (value) {
            setState(() {
              _rangeValues = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Etoiles",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        ),
        RangeSlider(
          labels: RangeLabels(
            '${_rangeValues.start.toInt()}',
            '${_rangeValues.end.toInt()}',
          ),
          activeColor: myOrange,
          inactiveColor: Colors.grey,
          divisions: 10000,
          min: 1,
          max: 100000,
          values: _rangeValues,
          onChanged: (value) {
            setState(() {
              _rangeValues = value;
            });
          },
        ),
        Card(
          child: ListTile(
            title: Text(
              "Nouveau arrivage",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            trailing: Checkbox(
              activeColor: myOrange,
              shape: const CircleBorder(),
              value: _selectedPrice,
              onChanged: (value) {
                setState(() {
                  _selectedPrice = value;
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "Tous les produits",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            trailing: Checkbox(
              activeColor: myOrange,
              shape: const CircleBorder(),
              value: _selectedPrice,
              onChanged: (value) {
                setState(() {
                  _selectedPrice = value;
                });
              },
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: () {},
          child: const Text("Retour"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: myOrange,
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: const Text("Appliquer"),
        ),
      ],
    );
  }
}
