import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeAgo;

String getTimeAgo(DateTime published) {
  Duration agoTime = DateTime.now().difference(published);
  // TODO: refactor when added localization choosing
  final localization = WidgetsBinding.instance.window.locale.languageCode;
  return timeAgo.format(DateTime.now().subtract(agoTime), locale: localization);
}
