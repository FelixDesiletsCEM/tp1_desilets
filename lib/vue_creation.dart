import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/http/service.dart';
import 'generated/l10n.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});
  @override
  State<CreationPage> createState() => _CreationPage();
}

class _CreationPage extends State<CreationPage> {
  final tasknameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageCreationTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: tasknameTextController, 
              decoration: InputDecoration(hintText: S.of(context).pageCreationNomTache)
            ),
            TextButton(
                onPressed: () async {/*Requête puis écran accueil*/
                  try {
                    AddTaskRequest request = AddTaskRequest("testName", DateTime.now());
                    var reponse = await addTask(request);
                      print(reponse);
                  } on DioException catch (e) {
                    String message = e.response.toString();
                      print(message);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(),
                    ),
                  );},
                child: Text(S.of(context).pageCreationAjoutTache)
            )
          ],
        ),
      ),
    );
  }
}