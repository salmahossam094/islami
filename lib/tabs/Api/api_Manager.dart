 // ignore_for_file: file_names

 import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/tabs/Api/RadioResponse.dart';
class ApiManager{
  static Future<RadioResponse> playRadio() async {
    Uri url =Uri.https("mp3quran.net",'/api/v3/radios');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RadioResponse radioResponse= RadioResponse.fromJson(json);
    return radioResponse;
  }
}