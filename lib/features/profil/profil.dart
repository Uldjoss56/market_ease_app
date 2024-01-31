import 'dart:io';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/profil_data.dart';
import 'package:e_com_app/features/registration_login/registration_and_login_screen.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:e_com_app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profil extends ConsumerStatefulWidget {
  const Profil({super.key});
  @override
  ConsumerState<Profil> createState() => _ProfilState();
}

class _ProfilState extends ConsumerState<Profil> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    selectedImage = null;
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myWhite,
        title: Center(
          child: Text(
            "Profil",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: user?.email != null
          ? SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: myGrisFonce55,
                              radius: 60,
                              foregroundImage: selectedImage != null
                                  ? FileImage(selectedImage!)
                                  : null,
                              child: selectedImage == null
                                  ? const Icon(
                                      Icons.person_3,
                                      size: 100,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 180,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ImageInput(
                                      onPickImage: (image) {
                                        setState(() {
                                          selectedImage = image;
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: myOrange,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user?.name ?? "",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        user?.username ?? "",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      Column(
                        children: List.generate(
                          profilData.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        profilData[index]['screen'],
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: myGris,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(
                                    profilData[index]['label'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  trailing: const SizedBox(
                                    width: 20,
                                    child: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'êtes pas connecté(e)",
                    style: TextStyle(
                      color: myGrisFonceAA,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationAndLoginScreen(
                            registrationMode: false,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Connectez-vous",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
