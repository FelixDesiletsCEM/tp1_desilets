import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../vue_inscription.dart';

class bouton_navigation extends StatelessWidget {
  const bouton_navigation({
    super.key, required this.texte, required this.targetPage
  });
 final String texte;
final MaterialPageRoute targetPage;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InscriptionPage(),
            ),
          );},
        child: Text(texte)
    );
  }
}