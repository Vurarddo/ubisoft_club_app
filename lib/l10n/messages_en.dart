// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String yearsInClub(years) => Intl.plural(
    years,
    one: 'Year in Club',
    other: 'Years in Club',
  );

  static String platform(platforms) => Intl.plural(
    platforms,
    one: 'platform',
    other: 'platforms',
  );

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "general" : MessageLookupByLibrary.simpleMessage("General"),
    "games" : MessageLookupByLibrary.simpleMessage("Games"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "sam" : MessageLookupByLibrary.simpleMessage("Sam"),
    "beta" : MessageLookupByLibrary.simpleMessage("Beta"),
    "like" : MessageLookupByLibrary.simpleMessage("Like"),
    "classicChallenges" : MessageLookupByLibrary.simpleMessage("Classic Challenges"),
    "weeklyChallenges" : MessageLookupByLibrary.simpleMessage("Weekly Challenges"),
    "isCompleted" : MessageLookupByLibrary.simpleMessage("is completed"),
    "isCompletedInUbisoftGames" : MessageLookupByLibrary.simpleMessage("is completed in Ubisoft games"),
    "redeemed" : MessageLookupByLibrary.simpleMessage("Redeemed a"),
    "legendaryReward" : MessageLookupByLibrary.simpleMessage("Legendary Reward"),
    "epicReward" : MessageLookupByLibrary.simpleMessage("Epic Reward"),
    "rareReward" : MessageLookupByLibrary.simpleMessage("Rare Reward"),
    "commonReward" : MessageLookupByLibrary.simpleMessage("Common Reward"),
    "exoticReward" : MessageLookupByLibrary.simpleMessage("Exotic Reward"),
    "legendary" : MessageLookupByLibrary.simpleMessage("Legendary"),
    "epic" : MessageLookupByLibrary.simpleMessage("Epic"),
    "rare" : MessageLookupByLibrary.simpleMessage("Rare"),
    "common" : MessageLookupByLibrary.simpleMessage("Common"),
    "exotic" : MessageLookupByLibrary.simpleMessage("Exotic"),
    "congratulations" : MessageLookupByLibrary.simpleMessage("Congratulations"),
    "clubLevel" : MessageLookupByLibrary.simpleMessage("Club level"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "level" : MessageLookupByLibrary.simpleMessage("Level"),
    "yearsInClub" : yearsInClub,
    "more" : MessageLookupByLibrary.simpleMessage("More"),
    "clubStatistic" : MessageLookupByLibrary.simpleMessage("Club statistic"),
    "purchasedGames" : MessageLookupByLibrary.simpleMessage("Purchased games"),
    "platform" : platform,
  };
}
