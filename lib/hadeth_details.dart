import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_theme.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;

    if (verses.isEmpty) {
      loadHadeth(index);
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Theme.of(context).brightness == Brightness.light
                  ? AssetImage('assets/images/background.png')
                  : AssetImage('assets/images/bg_dark.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إسلامي',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 450,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : MyThemeData.darkColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        decoration:  BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 0.5,
                                  color:Theme.of(context).brightness ==
                                      Brightness.light
                                      ? Theme.of(context).primaryColor
                                      : MyThemeData.darkColorIcon
                          )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("حديث ${index + 1}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : MyThemeData.darkColorIcon)),
                            const SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              verses[index],
                              style: GoogleFonts.amiri(
                                  color: Theme.of(context)
                                      .brightness ==
                                      Brightness.light
                                      ? Colors.black
                                      : MyThemeData.darkColorIcon,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            );
                          },
                          itemCount: verses.length,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadHadeth(int index) async {
    String hadeth =
        await rootBundle.loadString('assets/hadeth/h${index + 1}.txt');
    List<String> lines = hadeth.split('\n');
    verses = lines;

    setState(() {});
  }
}
