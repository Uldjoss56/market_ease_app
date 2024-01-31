import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/article_data.dart';
import 'package:e_com_app/widgets/show_modal_sheet.dart';
import 'package:flutter/material.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({
    super.key,
  });

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        title: isSearching
            ? TextField(
                style: const TextStyle(
                  color: myGrisFonce,
                ),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  filled: true,
                  fillColor: myGrisFonce22,
                  hintText: 'Rechercher',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            : Text(
                "Nouveaux arrivages",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
        actions: [
          if (!isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          IconButton(
            onPressed: () {
              myShowModalBottomSheet(context);
            },
            icon: const RotatedBox(
              quarterTurns: -1,
              child: Icon(
                Icons.tune,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(
              myNewArticle[index].pathToImg,
            ),
            title: Text(
              myNewArticle[index].name,
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
                  myNewArticle[index].description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      myNewArticle[index].price.toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
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
        ),
        itemCount: myNewArticle.length,
      ),
    );
  }
}
