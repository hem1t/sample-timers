import 'package:isar/isar.dart';
part 'presets.g.dart';

@collection
class Presets {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? presetName;

  String? timerCode;

  List<int>? timerVals;
}

// Won't work with super class
//
// @embedded
// class Preset {
// }

// @embedded
// class Chimes extends Preset {
//   Duration time = const Duration(seconds: 0);
//   Duration ctime = const Duration(seconds: 0);
// }

// @embedded
// class Pomodoro extends Preset {
//   int work = 30;
//   int rest = 5;
//   int long = 15;
//   int pomos = 3;
//   int sessions = 3;
// }
