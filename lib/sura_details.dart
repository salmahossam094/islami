import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/sura_details_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
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
                    color: Colors.white,
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
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 0.5,
                          )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${args.suraName}  رقم السورة  ${args.index+1}",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20)),
                            const SizedBox(
                              width: 1,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.play_circle)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: verses.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ))
                            : ListView.builder(
                                padding: const EdgeInsets.only(right: 10, top: 10),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '(${index + 1}) ${verses[index]}',
                                          style: GoogleFonts.amiri(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split('\n');
    verses = lines;

    setState(() {});
  }
}
