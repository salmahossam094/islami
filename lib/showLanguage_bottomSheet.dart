import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowLanguageBottomSheet extends StatelessWidget {
  const ShowLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  pro.chageLanguage('en');
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.english,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pro.Language == 'en'
                              ? Theme.of(context).primaryColor
                              : Colors.black45,
                          fontWeight: FontWeight.w400,
                          fontSize: 35),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: pro.Language == 'en'
                          ? Theme.of(context).primaryColor
                          : Colors.black45,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  pro.chageLanguage('ar');
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pro.Language == 'ar'
                              ? Theme.of(context).primaryColor
                              : Colors.black45,
                          fontWeight: FontWeight.w400,
                          fontSize: 35),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: pro.Language == 'ar'
                          ? Theme.of(context).primaryColor
                          : Colors.black45,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
