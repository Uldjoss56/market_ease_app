import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/historique_commande/new_detail.dart';
import 'package:flutter/material.dart';

class NewTab extends StatefulWidget {
  const NewTab({super.key});

  @override
  State<NewTab> createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'N°5486',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Leila Ida FALL',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nbre d'articles: 3 - 14:42",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$2499',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: width * 0.30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: myOrange,
                                  padding: const EdgeInsets.symmetric(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const NewDetail(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Voir les détails",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Rejeter",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: myYellow,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: myOrange.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      child: Text(
                        "Nouvelles",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: myOrange),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
