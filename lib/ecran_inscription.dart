import 'package:flutter/material.dart';

class ecran_inscription extends StatefulWidget {
  const ecran_inscription({super.key, required this.title});

  final String title;

  @override
  State<ecran_inscription> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ecran_inscription> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Inscription"),
            TextField(decoration: new InputDecoration.collapsed(hintText: 'Nom d\'utilisateur'),),
            TextField(decoration: new InputDecoration.collapsed(hintText: 'Mot de passe'),),
            TextField(decoration: new InputDecoration.collapsed(hintText: 'Confirmer le mot de passe'),),
            TextButton(onPressed: (){}, child: Text("Inscription")),
            FloatingActionButton(
              onPressed: () {
                // TODO quand on pop, on revient à l'écran précédent
                // ca enleve un ecran de la pile de navigation
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}