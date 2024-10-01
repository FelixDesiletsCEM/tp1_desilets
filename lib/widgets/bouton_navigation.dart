import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';
import '../vue_inscription.dart';

class bouton_navigation extends StatelessWidget {
  const bouton_navigation({
    super.key,
    required this.texte,
    required this.targetPage,
  });

  final String texte;
  final Widget targetPage;

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetPage,
          ),
        );
      },
      child: Text(texte)
    );
  }
}