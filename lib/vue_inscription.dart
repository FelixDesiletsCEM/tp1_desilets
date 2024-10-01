import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'http/service.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageInscriptionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).pageInscriptionTitre),
            TextField(decoration: const InputDecoration(hintText: 'Nom d\'utilisateur'), controller: usernameTextController,),
            TextField(decoration: const InputDecoration(hintText: 'Mot de passe'), controller: passwordTextController,),
            TextField(decoration: const InputDecoration(hintText: 'Confirmer le mot de passe'),),
            TextButton(
                onPressed: () async {/*Faire requête http puis aller à l'accueil.*/
                  {
                    try {
                      SignupRequest request = SignupRequest();
                      request.username = usernameTextController.text;
                      request.password = passwordTextController.text;
                      var reponse = await signup(request);
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
                child: Text(S.of(context).pageInscriptionTitre)
            ),
          ],
        ),
      ),
    );
  }
}