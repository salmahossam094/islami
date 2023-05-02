import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/showTheme_bottomSheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings';

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
            height: 20,
          ),
          Text(
            'Themeing',
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20),
          ),
          InkWell(
            onTap: () {
              showThemeSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    Theme.of(context).brightness == Brightness.light
                        ? 'Light'
                        : 'Dark',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Language',
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'English',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 35),
                            ),
                            Spacer(),
                            Icon(
                              Icons.done,
                              color: Theme.of(context).primaryColor,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Arabic',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black45
                                          : Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 35),
                            ),
                            Spacer(),
                            Icon(
                              Icons.done,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black45
                                  : Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('English',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }

  showThemeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowThemeBottomSheet();
        });
  }
}
