import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/hadeth_model.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  loadHadethFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then(
      (value) {
        List<String> hadethContent = value.split('#');
        for (int i = 0; i < hadethContent.length; i++) {
          int lastIndexOfFirstLine = hadethContent[i].trim().indexOf('\n');
          String title =
              hadethContent[i].trim().substring(0, lastIndexOfFirstLine);
          print(title);
          String content =
              hadethContent[i].trim().substring(lastIndexOfFirstLine + 1);
          HadethModel hadethModel = HadethModel(title, content);
          allAhadeth.add(hadethModel);

        }
        notifyListeners();
      },
    ).catchError((error) {
      print(error);
    });
  }
}
