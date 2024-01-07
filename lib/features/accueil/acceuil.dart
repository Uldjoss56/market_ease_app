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
      'description': '60% de bonus sur tous nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tous nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tous nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tous nos articles'
    },
    {
      'pathToImg': 'assets/casque.png',
      'name': 'BLACK FRIDAY',
      'description': '60% de bonus sur tous nos articles'
    },
  ];
  int currentCarousselView = 0;

  bool isUsingForProduct = true;
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
                    Row(
                      children: [
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
                                  child: Text(
                                    isUsingForProduct
                                        ? "Produits"
                                        : "Boutiques",
                                    style: const TextStyle(
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
                                child: Icon(
                                  isUsingForProduct
                                      ? Icons.shopify
                                      : Icons.store,
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
                          onPressed: () {
                            setState(() {
                              isUsingForProduct = !isUsingForProduct;
                            });
                          },
                          icon: Icon(
                            isUsingForProduct ? Icons.store : Icons.shopify,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: myWhite,
                            foregroundColor: myGrisFonce,
                            elevation: 5,
                            shadowColor: myGrisFonce,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
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
                                      : SizedBox(
                                          width: 20,
                                          child: Image.asset(
                                            myCategories[i].img.toString(),
                                            width: 20,
                                          ),
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
                                      : SizedBox(
                                          width: 20,
                                          child: Image.asset(
                                            myCategories[i].img.toString(),
                                            width: 20,
                                          ),
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
                padding: const EdgeInsets.only(
                  top: 15,
                ),
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
                      if (isUsingForProduct) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                  child: SizedBox(
                                                    width: 17,
                                                    child: Image.asset(
                                                      'assets/icon/like.png',
                                                      width: 17,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Image.asset(
                                                myArticle[index].pathToImg,
                                                width: 150,
                                              ),
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
                                                                FontWeight
                                                                    .w500),
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
                                            child: SizedBox(
                                              width: 17,
                                              child: Image.asset(
                                                'assets/icon/like.png',
                                                width: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Image.asset(
                                          myArticle[index].pathToImg,
                                          width: 150,
                                        ),
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
                      } else {
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
                              child: Card(
                                elevation: 5,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/enterprise_logo.jpg",
                                      width: 0.6 * width,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: const BoxDecoration(
                                            color: myWhite,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Business Center",
                                                    style: TextStyle(
                                                      color: myGrisFonce,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0.2 * width,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 4,
                                                    ),
                                                    width: 90,
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: myWhite,
                                                      borderRadius:
                                                          BorderRadius.all(
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
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: myYellow,
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          "4,54 M",
                                                          style: TextStyle(
                                                            color: myGrisFonce,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: myGrisFonce22,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Text(
                                                  "Eletronique, Mode",
                                                  style: TextStyle(
                                                    color: myGrisFonceAA,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: myOrange,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: const Row(
                                              children: [
                                                RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Icon(
                                                    Icons.sell_rounded,
                                                    color: myWhite,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "En promo",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                  color: myWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1,
                                      spreadRadius: 0.1,
                                      color: myGrisFonceAA,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  splashRadius: 5,
                                  iconSize: 20,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: myGrisFonceAA,
                                  ),
                                  style: IconButton.styleFrom(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text(
                      isUsingForProduct
                          ? "Nouveaux arrivages"
                          : "Nouvelles boutiques",
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
                      if (isUsingForProduct) {
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                      } else {
                        return Container(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Stack(
                            children: [
                              Card(
                                elevation: 5,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/mtn_logo.png",
                                      width: 0.6 * width,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: const BoxDecoration(
                                            color: myWhite,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Business Center",
                                                    style: TextStyle(
                                                      color: myGrisFonce,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0.2 * width,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 4,
                                                    ),
                                                    width: 90,
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: myWhite,
                                                      borderRadius:
                                                          BorderRadius.all(
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
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: myYellow,
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          "4,54 M",
                                                          style: TextStyle(
                                                            color: myGrisFonce,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: myGrisFonce22,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Text(
                                                  "Eletronique, Mode",
                                                  style: TextStyle(
                                                    color: myGrisFonceAA,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: myOrange,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: const Row(
                                              children: [
                                                RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Icon(
                                                    Icons.sell_rounded,
                                                    color: myWhite,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "En promo",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    color: myWhite,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                        spreadRadius: 0.1,
                                        color: myGrisFonceAA,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    splashRadius: 5,
                                    iconSize: 20,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Color(0xFFAA0000),
                                    ),
                                    style: IconButton.styleFrom(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
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
