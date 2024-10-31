import 'package:flutter/material.dart';
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

class _PageAccueil extends State<AccueilPage> {
  List<HomeItemResponse > tasks = [];
  void getListe()
  async {
    try {
      tasks = await home();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }

  @override
  void initState() {
    super.initState();
      getListe();
      setState(() {
      });
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
                    leading: SizedBox(child: Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'), width: 200, height: 200,)),
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