import "dart:convert";
import "dart:io";
import 'dart:async';

class Timer {
  bool ifCounting = false;
  int elapsedTime = 0;
  String Message =
      "To start/restart stopwatch, type 'start' or 's'\nTo stop, type 'stop' or 'break'\nTo reset, type 'reset' or 'r'";
  void initialize() {
    print('----------\nSTOP WATCH\n----------');
    print(Message);
    print('----------');
  }

  time_to_mmss(time) {
    String sec = (time % 60).toString().padLeft(2, '0');
    String min = (time ~/ 60).toString().padLeft(2, '0');
    return ('$min:$sec');
  }

  Future<void> count() async {
    while (ifCounting) {
      print(time_to_mmss(elapsedTime));
      await Future.delayed(Duration(seconds: 1));
      elapsedTime += 1;
    }
  }
}

// Future<String?> getUserInput(String message) async {
//   print(message);
//   return stdin.readLineSync();
// }

void main() async {
  Stream<String> readline() =>
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  Future<String?> getUserInput(String message) async {
    print(message);
    return stdin.readLineSync();
  }

  readline().listen(getstdin);
  var timer = Timer();
  timer.initialize();
  timer.ifCounting = true;
  timer.count();
}
