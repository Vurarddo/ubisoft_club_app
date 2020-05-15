import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class UbisoftClubLocalizations {
  static Future<UbisoftClubLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new UbisoftClubLocalizations();
    });
  }

  static UbisoftClubLocalizations of(BuildContext context) {
    return Localizations.of<UbisoftClubLocalizations>(
        context, UbisoftClubLocalizations);
  }

  String get general {
    return Intl.message(
      'General',
      name: 'general',
    );
  }

  String get games {
    return Intl.message(
      'Games',
      name: 'games',
    );
  }
}

class UbisoftClubLocalizationsDelegate
    extends LocalizationsDelegate<UbisoftClubLocalizations> {
  const UbisoftClubLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'uk'].contains(locale.languageCode);
  }

  @override
  Future<UbisoftClubLocalizations> load(Locale locale) {
    return UbisoftClubLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<UbisoftClubLocalizations> old) {
    return false;
  }
}
