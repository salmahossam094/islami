import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/radio.dart';
import 'package:islami/tabs/sebha.dart';

import 'tabs/quran.dart';

List<Widget> tabs = [
  RadioTab(),
  SebhaTab(),
  AhadethTab(),
  QuranTab(),
];

int index = 0;

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'إسلامي',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: tabs[index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: 'الراديو',
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio.png'),
                    size: 28,
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: 'السبحة',
                  icon: const ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                    size: 28,
                  )),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: 'أحاديث',
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                  size: 28,
                ),
              ),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: 'القرآن',
                  icon: const ImageIcon(
                    AssetImage('assets/images/quran.png'),
                    size: 28,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
