import 'package:e_com_app/const.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:flutter/material.dart';

class FiltrePage extends StatefulWidget {
  const FiltrePage({super.key});

  @override
  State<FiltrePage> createState() => _FiltrePageState();
}

class _FiltrePageState extends State<FiltrePage> {
  int selected = 0;
  RangeValues _rangePricesValues = const RangeValues(1, 100);
  RangeValues _rangeStarValues = const RangeValues(1, 2);
  bool? _selectedNew = true;
  bool? _selectedFamous = true;
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
                    icon: myCategories[index].img == null
                        ? const SizedBox()
                        : Image.asset(
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
                    icon: myCategories[index].img == null
                        ? const SizedBox()
                        : Image.asset(
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
        Row(
          children: [
            Text(
              "Prix",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            /*
            const Icon(
              Icons.sell_rounded,
              color: myYellow,
              size: 20,
            ),
            */
          ],
        ),
        RangeSlider(
          labels: RangeLabels(
            '${_rangePricesValues.start.toInt()}',
            '${_rangePricesValues.end.toInt()}',
          ),
          activeColor: myOrange,
          inactiveColor: Colors.grey,
          divisions: 10000,
          min: 1,
          max: 100000,
          values: _rangePricesValues,
          onChanged: (value) {
            setState(() {
              _rangePricesValues = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "Etoiles",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.star,
              color: myYellow,
            ),
          ],
        ),
        RangeSlider(
          labels: RangeLabels(
            '${_rangeStarValues.start.toInt()}',
            '${_rangeStarValues.end.toInt()}',
          ),
          activeColor: myOrange,
          inactiveColor: Colors.grey,
          divisions: 5,
          min: 0,
          max: 5,
          values: _rangeStarValues,
          onChanged: (value) {
            setState(() {
              _rangeStarValues = value;
            });
          },
        ),
        Card(
          surfaceTintColor: myGris,
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
              value: _selectedNew,
              onChanged: (value) {
                setState(() {
                  _selectedNew = value;
                });
              },
            ),
          ),
        ),
        Card(
          surfaceTintColor: myGris,
          child: ListTile(
            title: Text(
              "Populaire",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            trailing: Checkbox(
              activeColor: myOrange,
              shape: const CircleBorder(),
              value: _selectedFamous,
              onChanged: (value) {
                setState(() {
                  _selectedFamous = value;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: myGris,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
