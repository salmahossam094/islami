import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_details_model.dart';
import 'package:islami/providers/sura_provider.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = 'sura-details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    return ChangeNotifierProvider(
      create: (context) => SuraProvider()..loadFile(args.index),
      builder: (context, child) {
        var prov = Provider.of<SuraProvider>(context);
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
              height: MediaQuery.of(context).size.height - 100,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        // width: 300,
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height - 80,
                        // height: double.infinity,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color.fromRGBO(255, 255, 255, 50)
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
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Theme.of(context).primaryColor
                                            : MyThemeData.darkColorIcon)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${args.suraName}  رقم السورة  ${args.index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : MyThemeData.darkColorIcon)),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.play_circle),
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : MyThemeData.darkColorIcon,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: prov.verses.isEmpty
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ))
                                  : ListView.builder(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 10),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '(${index + 1}) ${prov.verses[index]}',
                                                style: GoogleFonts.amiri(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.black
                                                        : MyThemeData
                                                            .darkColorIcon,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      itemCount: prov.verses.length,
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
          ),
        );
      },
    );
  }
}
