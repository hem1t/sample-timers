extension DurationText on Duration {
  String get toText {
    var timerString = toString();
    return timerString.substring(0, timerString.indexOf('.')).padLeft(8, '0');
  }
}

extension GetItem on List<int> {
  int? getn(int n) {
    return  n < length && n > -1 ? this[n]: null;
  }
}
