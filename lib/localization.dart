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

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
    );
  }

  String get sam {
    return Intl.message(
      'Sam',
      name: 'sam',
    );
  }

  String get beta {
    return Intl.message(
      'Beta',
      name: 'beta',
    );
  }

  String get like {
    return Intl.message(
      'Like',
      name: 'like',
    );
  }

  String get classicChallenges {
    return Intl.message(
      'Classic Challenges',
      name: 'classicChallenges',
    );
  }

  String get weeklyChallenges {
    return Intl.message(
      'Weekly Challenges',
      name: 'weeklyChallenges',
    );
  }

  String get isCompleted {
    return Intl.message(
      'is completed',
      name: 'isCompleted',
    );
  }

  String get redeemed {
    return Intl.message(
      'Redeemed a',
      name: 'redeemed',
    );
  }

  String get legendaryReward {
    return Intl.message(
      'Legendary Reward',
      name: 'legendaryReward',
    );
  }

  String get epicReward {
    return Intl.message(
      'Epic Reward',
      name: 'epicReward',
    );
  }

  String get rareReward {
    return Intl.message(
      'Rare Reward',
      name: 'rareReward',
    );
  }

  String get commonReward {
    return Intl.message(
      'Common Reward',
      name: 'commonReward',
    );
  }

  String get exoticReward {
    return Intl.message(
      'Exotic Reward',
      name: 'exoticReward',
    );
  }

  String get legendary {
    return Intl.message(
      'Legendary',
      name: 'legendary',
    );
  }

  String get epic {
    return Intl.message(
      'Epic',
      name: 'epic',
    );
  }

  String get rare {
    return Intl.message(
      'Rare',
      name: 'rare',
    );
  }

  String get common {
    return Intl.message(
      'Common',
      name: 'common',
    );
  }

  String get exotic {
    return Intl.message(
      'Exotic',
      name: 'exotic',
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
