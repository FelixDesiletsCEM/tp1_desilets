import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/vue_connexion.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'package:tp1_desilets/vue_creation.dart';
import 'generated/l10n.dart';
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
        //TODO Prendre le nom pour de vrai. Surement créer un singleton lors du login?
        Text("Nom de l'utilisateur connecté"),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text(S.of(context).tiroirDeconnexion),
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
                builder: (context) => const ConnexionPage(),
              ),
            );
            // Then close the drawer
          },
        ),

        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text(S.of(context).tiroirAjoutTache),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreationPage(),
              ),
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text(S.of(context).pageAccueilTitre),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccueilPage(),
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