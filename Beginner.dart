import "dart:convert";
import "dart:io";
import 'dart:async';

class Timer {
  bool isCounting = false;
  int elapsedTime = 0;

  void start() {
    if (isCounting) {
      print('Timer already started');
    } else {
      isCounting = true;
      count();
      print('TIMER START!\n----------');
    }
  }

  void stop() {
    if (isCounting) {
      isCounting = false;
      print('TIMER STOP!\n----------');
    } else {
      print('Timer already stopped');
    }
  }

  void reset() {
    isCounting = false;
    elapsedTime = 0;
    print("TIMER RESET!\n---------");
  }

  Future<void> count() async {
    while (isCounting) {
      print(formatTime(elapsedTime));
      await Future.delayed(Duration(seconds: 1));
      elapsedTime += 1;
    }
  }

  String formatTime(int time) {
    String sec = (time % 60).toString().padLeft(2, '0');
    String min = (time ~/ 60).toString().padLeft(2, '0');
    return ('$min:$sec');
  }
}

class TimerUI {
  final Timer timer = Timer();
  final String initialMessage =
      "To start stopwatch, type 'start' or 's'\nTo stop, type 'stop' or 'break'\nTo reset, type 'reset' or 'r'";

  void initialize() {
    print('----------\nSTOP WATCH\n----------');
    print(initialMessage);
    print('----------');
  }

  Future<void> getStdin() async {
    await stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .forEach((line) {
      handleInput(line);
    });
  }

  void handleInput(String line) {
    if (line == 's' || line == 'start' || line == "START") {
      timer.start();
    } else if (line == 'x' || line == 'stop' || line == "break") {
      timer.stop();
    } else if (line == 'r' || line == 'reset' || line == "RESET") {
      timer.reset();
    } else {
      print('Invalid command');
    }
  }
}

void main() async {
  var timerUI = TimerUI();
  timerUI.initialize();
  timerUI.getStdin();
}
