import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp1_desilets/vue_inscription.dart';
import 'package:tp1_desilets/http/service.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/vue_accueil.dart';
import 'package:tp1_desilets/widgets/bouton_navigation.dart';
import 'generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();

}

class _ConnexionPageState extends State<ConnexionPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool loading = false;
  late SharedPreferences _prefs;
  String texteSauvegarde = '';
  Cookie? cookie;
  @override
  void initState() {
    super.initState();

    //Obtenir les préférences partagées
    // Attention, on obtient les préférence qu'une seule fois.
    // Si elles sont mises à jour par la suite, il faudra les obtenir à nouveau.
    getPrefs();



  }

  getPrefs() async {

    _prefs = await SharedPreferences.getInstance();
    _obtenirPrefs();
    //Récupération de la session
    if(texteSauvegarde != '' && texteSauvegarde.contains('|'))
    {
      try {
        SigninRequest request = SigninRequest();
        request.username = texteSauvegarde.split('|')[0];
        request.password = texteSauvegarde.split('|')[1];
        var reponse = await signin(request);
        print(reponse);
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccueilPage(),
          ),
        );
      } on DioException catch (e) {
        String message = e.response.toString();
        print(message);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(S.of(context).NetworkError)));
      }
    }
  }

  //Définir les préférences
  _definirPrefs(String pValue) {
    _prefs.setString('texteSauvegarde', pValue);
    setState(() {
      texteSauvegarde = pValue;
      //cookie = Cookie.fromSetCookieValue(pValue);
    });
  }

  //3 Obtenir les préférences
  _obtenirPrefs() {
    setState(() {
      texteSauvegarde = _prefs.getString('texteSauvegarde') ?? '';
      //cookie = Cookie.fromSetCookieValue(_prefs.getString('texteSauvegarde') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageConnexionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameTextController,
              decoration: InputDecoration(hintText: S.of(context).pageConnexionNom)
            ),
            TextField(
                controller: passwordTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConnexionMotDePasse)
            ),

            OutlinedButton(
                onPressed: loading? null: () async {
                   {
                     setState(() {
                       loading = true;
                     });
                    try {
                      SigninRequest request = SigninRequest();
                      request.username = usernameTextController.text;
                      request.password = passwordTextController.text;
                      var reponse = await signin(request);
                        print(reponse);

                      //List<Cookie> cookies = await SingletonDio.cookiemanager.cookieJar.loadForRequest(Uri.parse("http://10.0.2.2:8080/api/id/signin"));
                      //cookie = cookies.first;

                      _definirPrefs(request.username + '|' + request.password);
                    } on DioException catch (e) {
                      String message = e.response.toString();
                        print(message);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(S.of(context).NetworkError)));
                    }
                     setState(() {
                       loading = false;
                     });
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(),
                    ),
                  );},
                child: Text(S.of(context).pageConnexionConnexion)
            ),
            Visibility(
                child:LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.black,
              size: 200),
                    visible: loading,
            ),
            bouton_navigation(
                texte: S.of(context).pageInscriptionTitre,
                targetPage: const InscriptionPage(),
            ),
          ],
        ),
      ),
    );
  }
}
