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
  final dateController = TextEditingController();
  bool loading = false;
  DateTime deadline = DateTime.utc(1, 1, 1, 1,1,1);
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
            TextField(
                controller: dateController, //editing controller of this TextField
                decoration:  InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: deadline == DateTime.utc(1, 1, 1, 1,1,1)? S.of(context).pageCreationEntrerDate : deadline.toString() //label text of field
                ),
                readOnly: true,  // when true user cannot edit text
                onTap: () async {
                  //when click we have to show the datepicker
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)

                  );
                  deadline = pickedDate!;
                  setState(() {});
                }

                ),
            OutlinedButton(
                onPressed: loading? null: () async {
                  loading = true;
                  try {
                    AddTaskRequest request = AddTaskRequest(tasknameTextController.text, deadline);
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
                  );
                  loading = false;},
                child: Text(S.of(context).pageCreationAjoutTache)
            )
          ],
        ),
      ),
    );
  }
}