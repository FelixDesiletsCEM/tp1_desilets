import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/ecran_inscription.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vueAccueil.dart';
import 'tiroir_nav.dart';
import 'package:tp1_desilets/transfer/account.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
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
            TextField(
              controller: usernameTextController,
              decoration: new InputDecoration(hintText: "Username")
            ),
            TextField(
                controller: passwordTextController,
                decoration: new InputDecoration(hintText: "Password")
            ),
            TextButton(
                onPressed: () async {
                   {
                    try {
                      SigninRequest request = new SigninRequest();
                      request.username = usernameTextController.text;
                      request.password = passwordTextController.text;
                      var reponse = await signin(request);
                      print(reponse);
                    } on DioException catch (e) {
                      String message = e.response.toString();
                      print(message + "HAHAHAHAHA");
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(title: "Accueil"),
                    ),
                  );},
                child: Text("Connexion")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ecran_inscription(title: "Inscription"),
                    ),
                  );},
                child: Text("Inscription")
            ),
          ],
        ),
      ),
    );
  }
}
