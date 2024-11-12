import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'http/service.dart';
import 'generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmTextController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageInscriptionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).pageInscriptionTitre),
            TextField(decoration: InputDecoration(hintText: S.of(context).pageConnexionNom), controller: usernameTextController),
            TextField(decoration: InputDecoration(hintText: S.of(context).pageConnexionMotDePasse), controller: passwordTextController),
            TextField(decoration: InputDecoration(hintText: S.of(context).pageInscriptionConfirmation), controller: passwordConfirmTextController),
            OutlinedButton(
                onPressed: loading? null: () async {
                  {
                    if(passwordTextController.text != passwordConfirmTextController.text)
                    {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(S.of(context).pageInscriptionMotDePasseDifferent)));
                    }
                    else{
                      try {
                        setState(() {
                          loading = true;
                        });
                        SignupRequest request = SignupRequest();
                        request.username = usernameTextController.text;
                        request.password = passwordTextController.text;
                        var reponse = await signup(request);
                        if (kDebugMode) {
                          print(reponse);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AccueilPage()
                            )
                        );
                      } on DioException catch (e) {
                        String message = e.response.toString();
                        if (kDebugMode) {
                          print(message);
                        }
                        switch (message)
                        {
                          case "PasswordTooShort":
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(S.of(context).PasswordTooShort)));
                          case "UsernameAlreadyTaken":
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(S.of(context).UsernameAlreadyTaken)));
                          default:
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(message)));
                            //TODO  manque erreur reseau.
                        }
                      }
                      setState(() {
                        loading = false;
                      });
                    }
                  }
                },
                child: Text(S.of(context).pageInscriptionTitre)
            ),
            Visibility(
              child:LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 200),
              visible: loading,
            ),
          ],
        ),
      ),
    );
  }
}