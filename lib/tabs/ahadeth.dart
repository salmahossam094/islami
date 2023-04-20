import 'package:flutter/material.dart';
import 'package:islami/hadeth_details.dart';

class AhadethTab extends StatelessWidget {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/ahadeth_bg.png'),
            Divider(thickness: 3, color: Theme.of(context).primaryColor),
            Text(
              'الأحاديث',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Divider(thickness: 3, color: Theme.of(context).primaryColor),
            Column(
              children: [
                for (int i = 0; i < 50; i++) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,arguments: i);
                    },
                    child: Text(
                      'الحديث رقم ${i + 1}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                 Divider(
                   thickness: 1,
                   color: Theme.of(context).primaryColor,
                   indent: 30,
                   endIndent: 30,
                 )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
