import 'package:e_com_app/features/account/account.dart';
import 'package:e_com_app/features/boutique/become_boutique.dart';

import 'package:e_com_app/features/disconnect/disconnect.dart';

List<Map<String, dynamic>> profilData = [
  {
    "label": "Compte",
    "screen":  const Account(),
  },
  {
    "label": "Ma boutique",
    "screen": const BecomeBoutique(),
  },
  {
    "label": "Déconnexion",
    "screen": const Disconnect(),
  }
];
