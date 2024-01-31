import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/historique_commande/follow_commande.dart';
import 'package:flutter/material.dart';

class InProcessTab extends StatefulWidget {
  const InProcessTab({super.key});

  @override
  State<InProcessTab> createState() => _InProcessTabState();
}

class _InProcessTabState extends State<InProcessTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                          Row(
                            children: [
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
                              const Spacer(),
                              SizedBox(
                                width: width * 0.4,
                                height: height * 0.05,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: myOrange,
                                    padding: const EdgeInsets.symmetric(),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FollowCommande(),));
                                  },
                                  child: Text(
                                    "Suivre la commande",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
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
                        "En cours",
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
