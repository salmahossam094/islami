import 'package:flutter/material.dart';
import 'package:islami/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/hadeth_provider.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethProvider()..loadHadethFile(),
      builder: (context, child) {
        var pro = Provider.of<HadethProvider>(context);
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
                AppLocalizations.of(context)!.ahadeth,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Divider(
                thickness: 3,
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).primaryColor
                    : MyThemeData.darkColorIcon,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HadethDetails.routeName,
                              arguments: pro.allAhadeth[index]);
                        },
                        child: Text(
                          pro.allAhadeth[index].title,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Theme.of(context).primaryColor
                            : MyThemeData.darkColorIcon,
                        indent: 30,
                        endIndent: 30,
                      );
                    },
                    itemCount: pro.allAhadeth.length),
              )
            ],
          ),
        );
      },
    );
  }
}
