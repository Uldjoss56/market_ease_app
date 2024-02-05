import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class WriteAvis extends StatefulWidget {
  const WriteAvis({super.key});

  @override
  State<WriteAvis> createState() => _WriteAvisState();
}

class _WriteAvisState extends State<WriteAvis> {
  int starLevel = -1;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        backgroundColor: myWhite,
        title: Text(
          "Avis",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(
                "assets/laptop_mockup.jpg",
                width: width / 2,
                height: width / 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        starLevel = index;
                      });
                    },
                    icon: Icon(
                      Icons.star_rounded,
                      color: index <= starLevel ? myYellow : myGrisFonce55,
                    ),
                    style: IconButton.styleFrom(
                      elevation: 1,
                      shadowColor: myGrisFonceAA,
                      backgroundColor: myWhite,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Commentez",
                    style: TextStyle(
                      color: myGrisFonceAA,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                maxLines: 10,
                style: TextStyle(
                  color: myGrisFonce,
                ),
                decoration: InputDecoration(
                  hintText: "Ajouter un commentaire",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: myOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          /*
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddressPage(),
                            ),
                          );
                          */
                        },
                        child: Text(
                          "Soumettre",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
