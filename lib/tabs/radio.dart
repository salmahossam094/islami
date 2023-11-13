import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/tabs/Api/RadioResponse.dart';
import 'package:islami/tabs/Api/api_Manager.dart';

class RadioTab extends StatelessWidget {
  RadioTab({Key? key}) : super(key: key);

  final AudioPlayer? audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.playRadio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
          ));
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString(),
                    style: Theme.of(context).textTheme.bodyLarge),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.playRadio();
                    },
                    child: Text(
                      'Try Again',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Radios> rad = snapshot.data?.radios ?? [];
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/radio_pag.png'),
                 SizedBox(
                  height: 30.h,
                ),
                Text(
                  'إذاعة القرآن الكريم',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                 SizedBox(
                  height: 60.h,
                ),
                CarouselSlider(
                    options: CarouselOptions(),
                    items: rad.map((e) {
                      return Column(
                        children: [
                          Text(
                            e.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Theme.of(context).primaryColor
                                        : Colors.white),
                          ),
                           SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      audioPlayer!.play(UrlSource(e.url ?? ''));
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      size: 50,
                                    )),
                              ),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        audioPlayer!.stop();
                                      },
                                      icon: Icon(
                                        Icons.stop,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        size: 50,
                                      )))
                            ],
                          )
                        ],
                      );
                    }).toList())
              ],
            ),
          );
        }
        return const Text('error');
      },
    );
  }
}
