import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/http/service.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key, required this.task});

  final HomeItemResponse task;
  @override
  State<ConsultationPage> createState() => _ConsultationPage();
}

class _ConsultationPage extends State<ConsultationPage> {
  final pourcentageTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageConsultationTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nom de la tache:${widget.task.name}'),
            Text("La date d'échéance ${widget.task.name}"),
            Text("Pourcentage de complétion: ${widget.task.percentageDone}"),
            Text("Pourcentage du temps écoulé: ${widget.task.percentageDone}"),
            TextField(
                controller: pourcentageTextController,
                decoration: const InputDecoration(hintText: "Nouveau Pourcentage")
            ),
            TextButton(onPressed: ()async{
              try {
                ProgressEvent request = ProgressEvent();
                request.value = int.parse(pourcentageTextController.text);
                request.timestamp = DateTime.now();
                var reponse = await editTask(request);
                if (kDebugMode) {
                  print(reponse);
                }
              } on DioException catch (e) {
                String message = e.response.toString();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Il faut mettre le message ici.")));
              }
            }, child: const Text("Modifier la tache"))
          ],
        ),
      ),
    );
  }
}