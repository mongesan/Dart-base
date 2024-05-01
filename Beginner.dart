import "dart:convert";
import "dart:io";
import 'dart:async';

bool timerMoving = true;
int timerSaved = 0;
Future<String?> getUserInput(String message) async {
  print(message);
  return stdin.readLineSync();
}

Future<void> count(int timerInitial) async {
  int time = timerInitial;
  timerMoving = true;
  while (timerMoving) {
    await Future.delayed(Duration(seconds: 1));
    time += 1;
    // time in second
    String sec = (time % 60).toString();
    String min = (time ~/ 60).toString();
    if (sec.length == 1) {
      sec = '0' + sec;
    }
    if (min.length == 1) {
      min = '0' + min;
    }
    print("$min:$sec");
  }
  timerSaved = time;
}

Stream<String> readline() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

String Message =
    "To start/restart stopwatch, type 'start' or 's'\nTo stop, type 'stop' or 'break'\nTo reset, type 'reset' or 'r'";
void main() async {
  print('----------\nSTOP WATCH\n----------');
  print(Message);
  readline().listen(getstdin);
}

void getstdin(String line) {
  if (line == 'r' || line == 'reset' || line == "RESET") {
    print("TIMER RESET!\n---------");
    timerSaved = 0;
    timerMoving = false;
  } else if (line == 's' || line == 'start' || line == "START") {
    count(timerSaved);
  } else if (line == 'stop' || line == "break") {
    print('TIMER STOPPED!\n----------');
    timerMoving = false;
    print(Message);
  } else {
    print(Message);
  }
}
