extension DurationText on Duration {
  String get toText {
    var timerString = toString();
    return timerString.substring(0, timerString.indexOf('.')).padLeft(8, '0');
  }
}
