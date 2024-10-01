// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get pageAccueilTitre {
    return Intl.message(
      'Home',
      name: 'pageAccueilTitre',
      desc: '',
      args: [],
    );
  }

  /// `Refresh the list`
  String get pageAccueilActualiserListe {
    return Intl.message(
      'Refresh the list',
      name: 'pageAccueilActualiserListe',
      desc: '',
      args: [],
    );
  }

  /// `Connection`
  String get pageConnexionTitre {
    return Intl.message(
      'Connection',
      name: 'pageConnexionTitre',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get pageConnexionConnexion {
    return Intl.message(
      'Sign in',
      name: 'pageConnexionConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get pageConnexionInscription {
    return Intl.message(
      'Sign up',
      name: 'pageConnexionInscription',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get pageConsultationTitre {
    return Intl.message(
      'Consultation',
      name: 'pageConsultationTitre',
      desc: '',
      args: [],
    );
  }

  /// `Edit the task`
  String get pageConsultationModifier {
    return Intl.message(
      'Edit the task',
      name: 'pageConsultationModifier',
      desc: '',
      args: [],
    );
  }

  /// `New percentage`
  String get pageConsultationNouvelleValeur {
    return Intl.message(
      'New percentage',
      name: 'pageConsultationNouvelleValeur',
      desc: '',
      args: [],
    );
  }

  /// `Task name`
  String get pageConsultationNomTache {
    return Intl.message(
      'Task name',
      name: 'pageConsultationNomTache',
      desc: '',
      args: [],
    );
  }

  /// `Deadline`
  String get pageConsultationEcheance {
    return Intl.message(
      'Deadline',
      name: 'pageConsultationEcheance',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of completion: `
  String get pageConsultationPourcentageCompletion {
    return Intl.message(
      'Percentage of completion: ',
      name: 'pageConsultationPourcentageCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of elpapsed time: `
  String get pageConsultationPourcentageTemps {
    return Intl.message(
      'Percentage of elpapsed time: ',
      name: 'pageConsultationPourcentageTemps',
      desc: '',
      args: [],
    );
  }

  /// `Creation`
  String get pageCreationTitre {
    return Intl.message(
      'Creation',
      name: 'pageCreationTitre',
      desc: '',
      args: [],
    );
  }

  /// `Inscription`
  String get pageInscriptionTitre {
    return Intl.message(
      'Inscription',
      name: 'pageInscriptionTitre',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
