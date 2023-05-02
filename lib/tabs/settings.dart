import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Themeing',
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
                              'Light',
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
                              'Dark',
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
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border() ,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text('Light',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 20)),
            ),
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
            borderRadius: BorderRadius.circular(20),
            child: Text('English',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 20)),
          )
        ],
      ),
    );
  }
}
