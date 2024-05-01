void main() {
  DateTime now = DateTime.now();
  print(now);
  List<String> fruitlist = ['a', 'b', 'c', 'd'];
  for (var f in fruitlist) {
    print(f);
  }
  Map<String, int> scoreMap = {
    'enigma': 999,
    'palalyze': 100,
    'sky': 35,
    'submarine': 22,
  };
  print(scoreMap['enigma']);
}
