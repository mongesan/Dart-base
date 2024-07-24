import 'dart:io';
import 'dart:convert';

void main() async {
    print("START!");
    await stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .forEach((line) {
            print(line);
        });
    print("DONE!");
}
