import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/avis_list_data.dart';
import 'package:flutter/material.dart';

class Avis extends StatefulWidget {
  const Avis({super.key});

  @override
  State<Avis> createState() => _AvisState();
}

class _AvisState extends State<Avis> {
  double progressValueForFiveStar = 0.67;
  double progressValueForFourStar = 0.14;
  double progressValueForThreeStar = 0.05;
  double progressValueForTwoStar = 0.03;
  double progressValueForOneStar = 0.01;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Avis",
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, color: myYellow, size: 20),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: myYellow, size: 20),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: myYellow, size: 20),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: myYellow, size: 20),
                    SizedBox(width: 1),
                    Icon(Icons.star, color: myYellow, size: 20),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "1203 notes",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '4,9',
                      style: Theme.of(context).textTheme.displayLarge),
                  TextSpan(
                    text: ' sur 5',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "5",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: myYellow, size: 20),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValueForFiveStar,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "67%",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  "4",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: myYellow, size: 20),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValueForFourStar,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "14%",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  "3",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: myYellow, size: 20),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValueForThreeStar,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "5%",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  "2",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: myYellow, size: 20),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValueForTwoStar,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "3%",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  "1",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: myYellow, size: 20),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValueForOneStar,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "1%",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Text(
              "${avisList.length} avis",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      avisList.length,
                      (index) => ListTile(
                        titleAlignment: ListTileTitleAlignment.top,
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          avisList[index].posterName,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: myGrisFonce55,
                          radius: 20,
                          child: ClipOval(
                            child: Image.asset(
                              avisList[index].pathToposterPhoto,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    Icons.star,
                                    color:
                                        starIndex + 1 <= avisList[index].nbrStar
                                            ? myYellow
                                            : Colors.grey.withOpacity(0.5),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Text(avisList[index].review),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
