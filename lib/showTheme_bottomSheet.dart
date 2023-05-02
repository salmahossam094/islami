import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeBottomSheet extends StatelessWidget {
  const ShowThemeBottomSheet({Key? key}) : super(key: key);

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
                  pro.changeTheme(ThemeMode.light);
                },
                child: Row(
                  children: [
                    Text(
                      'Light',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  pro.changeTheme(ThemeMode.dark);
                },
                child: Row(
                  children: [
                    Text(
                      'Dark',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black45
                                  : Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 35),
                    ),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black45
                          : Colors.white,
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
