import "dart:convert";
import "dart:io";
import 'dart:async';

class Timer {
  bool ifCounting = false;
  int elapsedTime = 0;
  String Message =
      "To start stopwatch, type 'start' or 's'\nTo stop, type 'stop' or 'break'\nTo reset, type 'reset' or 'r'";
  
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

  Future<void> getStdin() async {
    await stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .forEach((line) {
      lineOperation(line);
    });
  }

  lineOperation(line) {
    if (line == 'r' || line == 'reset' || line == "RESET") {
      reset();
    } else if (line == 's' || line == 'start' || line == "START") {
      start();
    } else if (line == 'x' || line == 'stop' || line == "break") {
      stop();
    }
  }

  reset() {
    ifCounting = false;
    elapsedTime = 0;
    print("TIMER RESET!\n---------");
  }

  start() {
    if (ifCounting) {
      print('Timer already started');
    } else {
      ifCounting = true;
      count();
      print('TIMER START!\n----------');
    }
  }

  stop() {
    if (ifCounting) {
      ifCounting = false;
      print('TIMER STOP!\n----------');
    } else {
      print('Timer already stopped');
    }
  }
}

void main() async {
  var timer = Timer();
  timer.initialize();
  timer.count();
  timer.getStdin();
}
