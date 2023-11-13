import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/hadeth_model.dart';

import 'my_theme.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth';

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Theme.of(context).brightness == Brightness.light
                  ? const AssetImage('assets/images/background.png')
                  : const AssetImage('assets/images/bg_dark.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
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
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : MyThemeData.darkColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
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
                              Text(args.title,
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
                        Text(
                          args.content,
                          style: GoogleFonts.amiri(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Colors.black
                                      : MyThemeData.darkColorIcon,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
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
