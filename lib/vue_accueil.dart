import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/photo.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:tp1_desilets/vue_consultation.dart';
import 'http/service.dart';
import 'tiroir_nav.dart';
import 'generated/l10n.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});
  @override
  State<AccueilPage> createState() => _PageAccueil();
}

class _PageAccueil extends State<AccueilPage> with WidgetsBindingObserver{
  final stopwatch = Stopwatch();
  List<HomeItemPhotoResponse> tasks = [];
  void getListe()
  async {
    try {
      tasks = await homePhoto();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).NetworkError)));
    }

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
      stopwatch.stop();
      /*ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'On est parti pendant ${stopwatch.elapsed.inSeconds} secondes'),
        ),
      );*/
      stopwatch.reset();
    } else if (state == AppLifecycleState.paused) {
      stopwatch.start();
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
            TextButton(
                onPressed: ()
                {
                  getListe();
                  setState(() {});
                  },
                child: Text(S.of(context).pageAccueilActualiserListe)),
            SizedBox(
              height: 200.0,
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
                    leading: SizedBox(child: /*Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'), width: 200, height: 200,)*/ Text(tasks[index].photoId.toString())),
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