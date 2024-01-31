import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/models/article.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewArrivalCard extends StatefulWidget {
  const NewArrivalCard({super.key, required this.article});
  final Article article;

  @override
  State<NewArrivalCard> createState() => _NewArrivalCardState();
}

class _NewArrivalCardState extends State<NewArrivalCard> {
  final NumberFormat format = NumberFormat("#,###", "en");
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0.1,
            color: myGrisFonce55,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          widget.article.pathToImg,
        ),
        title: Text(
          widget.article.name,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.article.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "XOF ",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: myOrange,
                                fontWeight: FontWeight.w600,
                              )),
                      TextSpan(
                        text: format.format(widget.article.price),
                        style: const TextStyle(
                          color: myGrisFonce,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const InkWell(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: myOrange,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
