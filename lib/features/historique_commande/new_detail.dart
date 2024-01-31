import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class NewDetail extends StatefulWidget {
  const NewDetail({Key? key}) : super(key: key);

  @override
  State<NewDetail> createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail de la commande N°5486',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                    Text(
                      "N°5486",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: myOrange,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Heure et date de  commande: ",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          TextSpan(
                            text: "23/072023 - 14:42",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
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
                            text: "Lieu de livraison: ",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          TextSpan(
                            text: "+99GF, Bénin, Agla akplomè",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
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
                            text: "Client: ",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                          ),
                          TextSpan(
                            text: "Leila Ida FALL",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                      child: Text(
                        "Commandes",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: myOrange,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.2)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MacBook",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                "MacBook avec puces M3 garanti 2ans",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "x2",
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
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.3),
                          indent: 6,
                          endIndent: 6,
                        ),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MacBook",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                "MacBook avec puces M3 garanti 2ans",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "x2",
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
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Divider(
                            color: Colors.grey.withOpacity(0.3),
                            indent: 6,
                            endIndent: 6),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MacBook",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                "MacBook avec puces M3 garanti 2ans",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "x2",
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
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Divider(
                            color: Colors.grey.withOpacity(0.3),
                            indent: 6,
                            endIndent: 6),
                        ListTile(
                          title: Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          trailing: Text(
                            "\$ 2499",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myOrange,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.16,
                    vertical: 13,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Acceptez la commande",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: myOrange),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.18,
                    vertical: 13,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Rejetez la commande",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: myOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
