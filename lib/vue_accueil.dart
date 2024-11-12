import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/photo.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:tp1_desilets/vue_consultation.dart';
import 'http/service.dart';
import 'tiroir_nav.dart';
import 'generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});
  @override
  State<AccueilPage> createState() => _PageAccueil();
}

class _PageAccueil extends State<AccueilPage> with WidgetsBindingObserver{
  //final stopwatch = Stopwatch();
  bool loading = false;
  List<HomeItemPhotoResponse> tasks = [];
  void getListe()
  async {
    loading = true;
    try {
      tasks = await homePhoto();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).NetworkError)));
    }
    loading = false;
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
      getListe();
      setState(() {
      });
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getListe();
      setState(() {});

    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageAccueilTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: loading? null: ()
                {
                  getListe();
                  setState(() {
                    loading = true;
                  });
                  },
                child: Text(S.of(context).pageAccueilActualiserListe)),
            Visibility(
              child:LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 200),
              visible: loading,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsultationPage(task: tasks[index]),
                      ),
                    );},

                    leading: CachedNetworkImage(
                      imageUrl: "http://10.0.2.2:8080/file/${tasks[index].photoId}",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(tasks[index].name),
                    subtitle: Text(tasks[index].deadline.toIso8601String()),
                    trailing: Text(tasks[index].percentageDone.toString()),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}