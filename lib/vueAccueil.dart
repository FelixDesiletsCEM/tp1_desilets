import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:tp1_desilets/vueConsultation.dart';
import 'http/service.dart';
import 'tiroir_nav.dart';
class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key, required this.title});

  final String title;

  @override
  State<AccueilPage> createState() => _PageAccueil();
}

class _PageAccueil extends State<AccueilPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
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
    // TODO: implement initState
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
        title: Text(widget.title),
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
                child: Text("Actualiser la liste")),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsultationPage(title: "Consultation", task: tasks[index]),
                      ),
                    );},
                    leading: Text(tasks[index].name.toString()),
                    title: Text(tasks[index].deadline.toString()),
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