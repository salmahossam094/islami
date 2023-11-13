import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowThemeBottomSheet extends StatelessWidget {
  const ShowThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  pro.changeTheme(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.light ,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pro.themeMode == ThemeMode.light
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 35.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.done,
                      color: pro.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Colors.white,
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
                  pro.changeTheme(ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pro.themeMode == ThemeMode.light
                              ? Colors.black54
                              : MyThemeData.darkColorIcon,
                          fontWeight: FontWeight.w400,
                          fontSize: 35.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.done,
                      color: pro.themeMode == ThemeMode.light
                          ? Colors.black54
                          : MyThemeData.darkColorIcon,
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
