import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/transfer/photo.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key, required this.task});

  final HomeItemPhotoResponse task;
  @override
  State<ConsultationPage> createState() => _ConsultationPage();
}



class _ConsultationPage extends State<ConsultationPage> {
  final pourcentageTextController = TextEditingController();
  final picker = ImagePicker();
  var imageTask;
  getImage()
  async {
    imageTask = await taskPhoto(widget.task.photoId);
  }
  @override
  void initState() {
    super.initState();
    getImage();
    setState(() {});
  }

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
            imageTask==null? Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')):
            Image.memory(imageTask, width: 200, height: 200),
            TextButton(onPressed: ()async {
              try{
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  print("l'image a ete choisie ${pickedFile.path}");
                  var reponse = await postPhoto(File(pickedFile.path),  widget.task.id);
                  print(reponse);
                  getImage();
                  setState(() {});
                }}
              on DioException catch (e)
              {
                String message = e.response.toString();
                ScaffoldMessenger.of(context)
                    .showSnackBar( SnackBar(content: Text(message)));
              setState(() {});
              }}, child: Text("Change image")),
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
            }, child: Text(S.of(context).pageConsultationModifier)),
          TextButton(onPressed: (){}, child: Text(S.of(context).SuppressionTache))
          ],
        ),
      ),
    );
  }
}