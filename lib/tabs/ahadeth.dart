import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_details.dart';

import '../models/hadeth_model.dart';
import '../my_theme.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/ahadeth_bg.png'),
          Divider(
            thickness: 3,
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : MyThemeData.darkColorIcon,
          ),
          Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Divider(
            thickness: 3,
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : MyThemeData.darkColorIcon,
          ),
        Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
            return  TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                    arguments: allAhadeth[index]);
              },
              child: Text(
                allAhadeth[index].title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }, separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : MyThemeData.darkColorIcon,
              indent: 30,
              endIndent: 30,
            );
          }, itemCount: allAhadeth.length),
        )
        ],
      ),
    );
  }

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
          setState(() {});
        }
      },
    ).catchError((error) {
      print(error);
    });
  }
}
