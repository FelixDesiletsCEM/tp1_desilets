import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tp1_desilets/vue_inscription.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'package:tp1_desilets/widgets/bouton_navigation.dart';
import 'generated/l10n.dart';


class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageConnexionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameTextController,
              decoration: InputDecoration(hintText: S.of(context).pageConnexionConnexion)
            ),
            TextField(
                controller: passwordTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConnexionInscription)
            ),
            TextButton(
                onPressed: () async {
                   {
                    try {
                      SigninRequest request = SigninRequest();
                      request.username = usernameTextController.text;
                      request.password = passwordTextController.text;
                      var reponse = await signin(request);
                      if (kDebugMode) {
                        print(reponse);
                      }
                    } on DioException catch (e) {
                      String message = e.response.toString();
                      if (kDebugMode) {
                        print(message);
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(),
                    ),
                  );},
                child: Text(S.of(context).pageConnexionConnexion)
            ),
            bouton_navigation(
                texte: "Inscription",
                targetPage: InscriptionPage(),
            ),
          ],
        ),
      ),
    );
  }
}
