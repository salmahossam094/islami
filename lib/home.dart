import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/radio.dart';
import 'package:islami/tabs/sebha.dart';
import 'package:islami/tabs/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'tabs/quran.dart';

List<Widget> tabs = [
  RadioTab(),
  SebhaTab(),
  AhadethTab(),
  QuranTab(),
  SettingsTab(),
];

int index = 0;

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       if (Theme.of(context).brightness==Brightness.light) ...[
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            )),] else ...[
         SizedBox(
             width: double.infinity,
             child: Image.asset(
               'assets/images/bg_dark.png',
               fit: BoxFit.fill,
             ))
       ]
        ,
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
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
                  label: AppLocalizations.of(context)!.radio,
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio.png'),
                    size: 28,
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: AppLocalizations.of(context)!.sebha,
                  icon: const ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                    size: 28,
                  )),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: AppLocalizations.of(context)!.ahadeth,
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                  size: 28,
                ),
              ),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: AppLocalizations.of(context)!.quran,
                  icon: const ImageIcon(
                    AssetImage('assets/images/quran.png'),
                    size: 28,
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: AppLocalizations.of(context)!.settings,
                  icon: const Icon(
                    Icons.settings,
                    size: 28,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
