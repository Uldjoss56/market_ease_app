import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class DismissDetail extends StatefulWidget {
  const DismissDetail({super.key});

  @override
  State<DismissDetail> createState() => _DismissDetailState();
}

class _DismissDetailState extends State<DismissDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Annulée",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: myOrange,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Détails de la commande",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    subtitle: Text(
                      "Uniqueby's",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black.withOpacity(0.6),
                          ),
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.2)),
                  ListTile(
                    title: Text(
                      "Macbook",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    subtitle: Text(
                      "x2",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black.withOpacity(0.6),
                          ),
                    ),
                    trailing: Text(
                      "\$ 2499",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      "Montant à payer",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.3)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "1 article",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          trailing: Text(
                            "\$ 2499",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Livraison",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          trailing: Text(
                            "\$ 2499",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Promo",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          trailing: Text(
                            "\$ 2499",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                        ),
                        Divider(color: Colors.grey.withOpacity(0.2)),
                        ListTile(
                          title: Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          trailing: Text(
                            "\$ 2499",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}