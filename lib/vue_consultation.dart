import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'generated/l10n.dart';
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
            Text('${S.of(context).pageConsultationNomTache} ${widget.task.name}'),
            Text("${S.of(context).pageConsultationEcheance} ${widget.task.name}"),
            Text("${S.of(context).pageConsultationPourcentageCompletion} ${widget.task.percentageDone}"),
            Text("${S.of(context).pageConsultationPourcentageTemps} ${widget.task.percentageDone}"),
            TextField(
                controller: pourcentageTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConsultationNouvelleValeur)
            ),
            TextButton(onPressed: ()async{
              try {
                ProgressEvent request = ProgressEvent(int.parse(pourcentageTextController.text), DateTime.now());
                var reponse = await editTask(request, super.widget.task.id);
                if (kDebugMode) {
                  print(reponse);
                }
              } on DioException catch (e) {
                String message = e.response.toString();
                ScaffoldMessenger.of(context)
                    .showSnackBar( SnackBar(content: Text(message)));
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
            }, child: Text(S.of(context).pageConsultationModifier))
          ],
        ),
      ),
    );
  }
}