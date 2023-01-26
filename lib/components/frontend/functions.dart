import 'dart:math';

import 'package:doctors/constants.dart';

String padString(int input) {
  if (input < 10) {
    return input.toString().padLeft(2, "0");
  }
  return input.toString();
}

String getDailyUpdateTileTime() {
  DateTime time = DateTime(
    2022,
    Random().nextInt(12),
    Random().nextInt(28),
    Random().nextInt(24),
    Random().nextInt(60),
  );
  return "${months[time.month - 1]} ${padString(time.day)}, ${convertAmtoPm(time)}";
}

String convertAmtoPm(DateTime time) {
  if (time.hour > 12) {
    return "${padString(time.hour % 12)}.${padString(time.minute)} PM";
  }
  return "${padString(time.hour)}.${padString(time.minute)} AM";
}
