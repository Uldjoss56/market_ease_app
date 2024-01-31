import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final teamData = [
      [
        "assets/team/Ulrich_DJOSSOU.jpg",
        "Ulrich Comlan DJOSSOU",
        "Mobile Developer/ XR Developer",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Prince DEGBOE",
        "Mobile Developer",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Aquillas KIKISSAGBE",
        "",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Happy DAGBA",
        "",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Hervé SENOU",
        "",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Berèl AGOSSA",
        "",
      ],
      [
        "assets/team/xr-avatar.jpg",
        "Carialle SONON",
        "",
      ],
    ];
    return SingleChildScrollView(
      child: Column(
        children: List.generate(teamData.length, (index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: myWhite,
              radius: width / 10,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: Image.asset(
                    teamData[index][0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(teamData[index][1]),
            subtitle: Text(teamData[index][2]),
          );
        }),
      ),
    );
  }
}
