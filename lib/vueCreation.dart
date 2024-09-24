import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:tp1_desilets/vueAccueil.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/http/service.dart';
class CreationPage extends StatefulWidget {
  const CreationPage({super.key, required this.title});

  final String title;

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: tasknameTextController, 
              decoration: new InputDecoration(hintText: "Task name")
            ),
            TextButton(
                onPressed: () async {/*Requête puis écran accueil*/
                  try {
                    AddTaskRequest request = new AddTaskRequest();
                    request.name = "testName";
                    request.deadline = DateTime(2024,10, 10, 0, 0, 0);
                    var reponse = await addTask(request);
                    print(reponse);
                  } on DioException catch (e) {
                    String message = e.response.toString();
                    print(message + "HAHAHAHAHA");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(title: "Accueil"),
                    ),
                  );},
                child: Text("Add task")
            )
          ],
        ),
      ),
    );
  }
}