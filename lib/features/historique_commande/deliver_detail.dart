import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class DeliverDetail extends StatefulWidget {
  const DeliverDetail({super.key});

  @override
  State<DeliverDetail> createState() => _DeliverDetailState();
}

class _DeliverDetailState extends State<DeliverDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Livrée",
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
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text(
                      "Livraison",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Date: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              TextSpan(
                                text: "23 juillet 2023",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Heure: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              TextSpan(
                                text: "13:42",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w500,
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
            )
          ],
        ),
      ),
    );
  }
}
