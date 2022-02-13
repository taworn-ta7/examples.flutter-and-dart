import 'package:flutter/material.dart';
import 'app.dart';

/// Localization utilityclass.
class Localization {
  static Localization? _instance;

  static Localization instance() {
    _instance ??= Localization();
    return _instance!;
  }

  // ----------------------------------------------------------------------

  /// Construction.
  Localization();

  /// Supported locale list.
  final list = const [
    Locale('en'),
    Locale('th'),
  ];

  /// Current locale.
  Locale get current => list[_index];
  int _index = 0;

  /// Change locale.
  void changeLocale(BuildContext context, String locale) {
    late int i;
    switch (locale) {
      case 'th-TH':
      case 'th_TH':
      case 'th':
        i = 1;
        break;

      case 'en-US':
      case 'en_US':
      case 'en':
      case '':
      default:
        i = 0;
        break;
    }

    if (_index != i) {
      _index = i;
      App.refresh(context);
    }
  }
}
