import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/main.dart';
import 'package:tp1_desilets/main.dart';
import 'package:tp1_desilets/vueAccueil.dart';
import 'package:tp1_desilets/vueConsultation.dart';
import 'package:tp1_desilets/vueCreation.dart';

import 'vueCreation.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({super.key});

  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,

        ),
        Text("Nom de l'utilisateur connecté"),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Déconnexion"),
          onTap: () async{
            try{
              var reponse = await signout();
              print(reponse);
            }
            on DioException catch(e){
              print(e);
            }
            // TODO ferme le tiroir de navigation, enlever la fleche pour revenir.
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: "Connexion"),
              ),
            );
            // Then close the drawer
          },
        ),

        // TODO le tiroir de navigation ne peut pointer que vers des
        // ecran sans paramtre.
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Ajout de tâche"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreationPage(title: "Creation"),
              ),
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Accueil"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccueilPage(title: "Accueil"),
              ),
            );
            // Then close the drawer
          },
        ),
      ],
    );

    return Drawer(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}