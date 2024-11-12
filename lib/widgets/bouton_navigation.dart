import 'package:flutter/material.dart';

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

    return OutlinedButton(
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