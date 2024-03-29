import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/show_language_bottom_sheet.dart';
import 'package:islami/show_theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.themeing,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20.sp),
          ),
          InkWell(
            onTap: () {
              showThemeSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    prov.themeMode==ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 20.sp)),
              ),
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20.sp),
          ),
          InkWell(
            onTap: () {
              showLanguageSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    prov.language == 'ar'
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 20.sp)),
              ),
            ),
          )
        ],
      ),
    );
  }

  showLanguageSheet() {
    showModalBottomSheet(
        // backgroundColor: Theme.of(context).brightness == Brightness.light
        //     ? Colors.white
        //     : Colors.white,
        context: context,
        builder: (context) {
          return const ShowLanguageBottomSheet();
        });
  }

  showThemeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ShowThemeBottomSheet();
        });
  }
}
