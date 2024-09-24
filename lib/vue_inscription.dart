import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vue_accueil.dart';

import 'http/service.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key, required this.title});

  final String title;

  @override
  State<InscriptionPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InscriptionPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Inscription"),
            TextField(decoration: const InputDecoration.collapsed(hintText: 'Nom d\'utilisateur'), controller: usernameTextController,),
            TextField(decoration: const InputDecoration.collapsed(hintText: 'Mot de passe'), controller: passwordTextController,),
            TextField(decoration: const InputDecoration.collapsed(hintText: 'Confirmer le mot de passe'),),
            TextButton(
                onPressed: () async {/*Faire requête http puis aller à l'accueil.*/
                  {
                    try {
                      SignupRequest request = SignupRequest();
                      request.username = usernameTextController.text;
                      request.password = passwordTextController.text;
                      var reponse = await signup(request);
                      print(reponse);
                    } on DioException catch (e) {
                      String message = e.response.toString();
                      print(message + "HAHAHAHAHA");
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(title: "Accueil"),
                    ),
                  );},
                child: const Text("Inscription")
            ),
          ],
        ),
      ),
    );
  }
}