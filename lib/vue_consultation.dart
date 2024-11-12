import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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



class _ConsultationPage extends State<ConsultationPage> with WidgetsBindingObserver {
  final pourcentageTextController = TextEditingController();
  final picker = ImagePicker();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    } else if (state == AppLifecycleState.paused) {
      //TODO Sauvegarder les infos? Pour le refresh.

    }
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
            Expanded(child: CachedNetworkImage(
              imageUrl: "http://10.0.2.2:8080/file/${widget.task.photoId}" ,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
            Expanded(child:
            OutlinedButton(onPressed: loading? null: ()async {
              loading = true;
              try{
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  print(S.of(context).pageConsultationImageChoisie + pickedFile.path);
                  var reponse = await postPhoto(File(pickedFile.path),  widget.task.id);
                  print(reponse);
                  setState(() {});
                }}
              on DioException catch (e)
              {
                String message = e.response.toString();
                ScaffoldMessenger.of(context)
                    .showSnackBar( SnackBar(content: Text(message)));
                //TODO Quand on appui, l'image change.
                setState(() {});
              }
              loading = false;}, child: Text(S.of(context).pageConsultationChangerImage)),
            ),
            Expanded(child:
            Text('${S.of(context).pageConsultationNomTache} ${widget.task.name}'),
            ),
      Expanded(child:
            Text("${S.of(context).pageConsultationPourcentageCompletion} ${widget.task.percentageDone}"),
      ),
      Expanded(child:
            Text("${S.of(context).pageConsultationPourcentageTemps} ${widget.task.percentageDone}"),
      ),
      Expanded(child:
            TextField(
                controller: pourcentageTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConsultationNouvelleValeur)
            ),
      ),
      Expanded(child:
            OutlinedButton(onPressed: loading? null: ()async{
              loading = true;
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
              loading = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
            }, child: Text(S.of(context).pageConsultationModifier)),
      ),
      Expanded(child:
          OutlinedButton(onPressed: loading? null: (){}, child: Text(S.of(context).SuppressionTache)))
          ],
        ),
      ),
    );
  }
}