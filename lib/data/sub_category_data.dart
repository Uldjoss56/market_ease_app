import 'package:e_com_app/features/boutique/sub_cat_content/electronic/casque.dart';
import 'package:e_com_app/features/boutique/sub_cat_content/electronic/computer.dart';
import 'package:e_com_app/features/boutique/sub_cat_content/electronic/ecouteur.dart';
import 'package:e_com_app/features/boutique/sub_cat_content/electronic/montre.dart';
import 'package:e_com_app/features/boutique/sub_cat_content/electronic/mouse.dart';
import 'package:e_com_app/features/boutique/sub_cat_content/electronic/phone.dart';

List<Map<String, dynamic>> electroSubCategoriData = [
  {
    "subCategoriName":"Casque",
    "imgPath":"assets/electro_sub_category/casque.png",
    "content":const Casque(),
  },
    {
    "subCategoriName":"Ecouteur",
    "imgPath":"assets/electro_sub_category/ecouteur.png",
    "content":const Ecouteur(),
  },
    {
    "subCategoriName":"Montre",
    "imgPath":"assets/electro_sub_category/montre.png",
    "content":const Montre(),
  },
    {
    "subCategoriName":"Téléphone",
    "imgPath":"assets/electro_sub_category/phone.png",
    "content": const Phone(),
  },
    {
    "subCategoriName":"Ordinateur",
    "imgPath":"assets/electro_sub_category/ordi.png",
    "content":const Computer(),
  },
    {
    "subCategoriName":"Souris",
    "imgPath":"assets/electro_sub_category/souris.png",
    "content":const Mouse(),
  },
];
