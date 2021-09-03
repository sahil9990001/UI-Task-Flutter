import 'dart:convert';
import 'package:http/http.dart';

import 'package:ui_task/Modal/technical_modal.dart';

class ApiServices {
  static Future<Welcome> fetchInfo() async {
    Response response = await get(Uri.parse(
        "https://api.bottomstreet.com/forex/technical?forex_name=USDINR"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var json = jsonDecode(jsonString);
      var list = Welcome.fromJson(json);
      return list;
    } else {
      throw ("Can't fetch data");
    }
  }
}
