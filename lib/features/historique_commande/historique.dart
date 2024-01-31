import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/historique_commande/tab/deliver_tab.dart';
import 'package:e_com_app/features/historique_commande/tab/dismiss_tab.dart';
import 'package:e_com_app/features/historique_commande/tab/in_process_tab.dart';
import 'package:e_com_app/features/historique_commande/tab/new_tab.dart';
import 'package:flutter/material.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Historique des commandes',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          bottom: TabBar(
            indicatorColor: myOrange,
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            tabs: [
              Tab(
                child: Text(
                  'Nouvelles',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
              ),
              Tab(
                child: Text(
                  'En cours',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
              ),
              Tab(
                child: Text(
                  'Livrer',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
              ),
              Tab(
                child: Text(
                  'Rejeter',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ),
                ),
              ),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              NewTab(),
              InProcessTab(),
              DeliverTab(),
              DismissTab(),
            ],
          ),
        ),
      ),
    );
  }
}
