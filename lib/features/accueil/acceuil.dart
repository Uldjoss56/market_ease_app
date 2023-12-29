import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com_app/const.dart';
import 'package:e_com_app/data/article_data.dart';
import 'package:e_com_app/data/bottom_data.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:e_com_app/features/famous/famous_page.dart';
import 'package:e_com_app/features/new_arrivals/new_arrivals.dart';
import 'package:e_com_app/features/product_detail/product_detail.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';
import 'package:e_com_app/widgets/show_modal_sheet.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});
  @override
  State<Accueil> createState() {
    return _AccueilState();
  }
}

class _AccueilState extends State<Accueil> {
  int selected = 0;
  CarouselController carouselController = CarouselController();
  var carousselData = [
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tout nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tout nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tout nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tout nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tout nos articles'
    },
  ];
  int currentCarousselView = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 20,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.dashboard_rounded,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: myOrange,
                        foregroundColor: myWhite,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 40, 10),
                              decoration: const BoxDecoration(
                                color: myOrange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Produits",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: myWhite,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 0),
                                  color: myGrisFonce55,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.shopify_outlined,
                              color: myOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.store,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: myWhite,
                        foregroundColor: myGrisFonce,
                        elevation: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              /*
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Godomey, Boulangerie",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              */
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: myGrisFonce,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.search,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Rechercher',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: myGrisFonce22,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: myGrisFonce22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        myShowModalBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.tune,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: myOrange,
                        foregroundColor: myWhite,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        for (int i = 0; i < myCategories.length; i++) ...[
                          selected == i
                              ? ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: myOrange,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  label: Text(myCategories[i].title),
                                  icon: myCategories[i].img == null
                                      ? const SizedBox()
                                      : Image.asset(
                                          myCategories[i].img.toString(),
                                          width: 20,
                                        ),
                                )
                              : OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() => selected = i);
                                  },
                                  icon: myCategories[i].img == null
                                      ? const SizedBox()
                                      : Image.asset(
                                          myCategories[i].img.toString(),
                                          width: 20,
                                        ),
                                  label: Text(myCategories[i].title),
                                ),
                          if (i != myCategories.length - 1)
                            const SizedBox(width: 10),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentCarousselView = index;
                    });
                  },
                  height: height * 0.2,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 10),
                ),
                items: carousselData.map(
                  (element) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Color.fromARGB(255, 116, 115, 115)
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                element['name'].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              subtitle: Text(
                                element['description'].toString(),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              leading:
                                  Image.asset(element['pathToImg'].toString()),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  carousselData.length,
                  (index) {
                    if (index == currentCarousselView) {
                      return Container(
                        margin: const EdgeInsets.all(2),
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: myYellow,
                          shape: BoxShape.circle,
                        ),
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.all(2),
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: myGrisFonceAA,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                /*
                children: [
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: myGrisFonceAA,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: myGrisFonceAA,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: myGrisFonceAA,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
                */
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text(
                      "Populaire",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FamousPage(),
                            ),
                          );
                        },
                        child: Text(
                          "voir plus",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color: myYellow, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    myArticle.length,
                    (index) {
                      if (index == myArticle.length - 1) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const ProductDetailPage();
                                    },
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 13,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/icon/like.png',
                                                  width: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            myArticle[index].pathToImg,
                                            width: 150,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            myArticle[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            myArticle[index].price.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Card(
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: myYellow,
                                                ),
                                                Text(
                                                  myArticle[index]
                                                      .likesCount
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const FamousPage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return const ProductDetailPage();
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 13,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/icon/like.png',
                                            width: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      myArticle[index].pathToImg,
                                      width: 150,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      myArticle[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      myArticle[index].price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    Card(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: myYellow,
                                          ),
                                          Text(
                                            myArticle[index]
                                                .likesCount
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text(
                      "Nouveaux arrivages",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NewArrivals(),
                          ));
                        },
                        child: Text(
                          "voir plus",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color: myYellow, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    myNewArticle.length,
                    (index) {
                      if (index == myNewArticle.length - 1) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const ProductDetailPage();
                                    },
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: width * 0.8,
                                child: Card(
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
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          myNewArticle[index].description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              myNewArticle[index]
                                                  .price
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
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
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const NewArrivals(),
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: myGrisFonceAA,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return const ProductDetailPage();
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          width: width * 0.8,
                          child: Card(
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
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    myNewArticle[index].description,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        myNewArticle[index].price.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
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
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        bottomData: bottomList,
        currentPage: 0,
      ),
    );
  }
}
