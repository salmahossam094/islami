import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_details_model.dart';
import 'package:islami/providers/sura_provider.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = 'sura-details';

  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    return ChangeNotifierProvider(
      create: (context) => SuraProvider()..loadFile(args.index),
      builder: (context, child) {
        var prov = Provider.of<SuraProvider>(context);
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
              height: MediaQuery.of(context).size.height - 200,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Container(
                        // width: 300,
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height - 70,
                        // height: double.infinity,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color.fromRGBO(255, 255, 255, 50)
                                  : MyThemeData.darkColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             SizedBox(height: 15.h),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 25,
                                right: 25,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5.w,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Theme.of(context).primaryColor
                                            : MyThemeData.darkColorIcon)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${args.suraName}  رقم السورة  ${args.index + 1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white)),
                                   SizedBox(
                                    width: 1.w,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_circle),
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : MyThemeData.darkColorIcon,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: prov.verses.isEmpty
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ))
                                  : ListView.builder(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 10),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Expanded(
                                                child: RichText(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text:
                                                            ' ${prov.verses[index].trim()}',
                                                        style: GoogleFonts.amiri(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .light
                                                                ? Colors.black
                                                                : Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 25.sp),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' \u06dd${index + 1}',
                                                        style: GoogleFonts.amiri(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .light
                                                                ? Theme.of(
                                                                        context)
                                                                    .primaryColor
                                                                : const Color(
                                                                    0xFFB7935F),
                                                            fontSize: 25.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ]))),
                                          ],
                                        );
                                      },
                                      itemCount: prov.verses.length,
                                    ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
