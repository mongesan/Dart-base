import "dart:convert";
import "dart:io";
import 'dart:async';

class Timer {
  bool ifcounting = false;
  int time = 0;
  String Message =
      "To start/restart stopwatch, type 'start' or 's'\nTo stop, type 'stop' or 'break'\nTo reset, type 'reset' or 'r'";
  void initialize() {
    print('----------\nSTOP WATCH\n----------');
    print(Message);
    print('----------');
  }

  Future<void> count() async {
    while (ifcounting) {
      await Future.delayed(Duration(seconds: 1));
      time += 1;
      print(time);
    }
  }
}

// String sec = (time % 60).toString();
//       String min = (time ~/ 60).toString();
//       if (sec.length == 1) {
//         sec = '0' + sec;
//       }
//       if (min.length == 1) {
//         min = '0' + min;
//       }
//       print("$min:$sec");
// Future<String?> getUserInput(String message) async {
//   print(message);
//   return stdin.readLineSync();
// }

void main() async {
  Stream<String> readline() =>
      stdin.transform(utf8.decoder).transform(const LineSplitter());
  // readline().listen(getstdin);
  var timer = Timer();
  timer.initialize();
  timer.ifcounting = true;
  timer.count();
}
