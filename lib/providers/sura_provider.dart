import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SuraProvider extends ChangeNotifier {
  List<String> verses = [];

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split('\n');
    verses = lines;
    notifyListeners();
  }
}
