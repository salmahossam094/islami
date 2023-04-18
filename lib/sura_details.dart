import 'package:flutter/material.dart';
import 'package:islami/sura_details_model.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = 'sura-details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
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
                            Text(args.suraName,
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              width: 2,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.play_circle)),
                          ],
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
}
