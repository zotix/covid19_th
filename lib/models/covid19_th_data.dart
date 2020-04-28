import 'dart:convert';

import 'package:covid19th/models/covid19_th.dart';
import 'package:http/http.dart' as http;

class Covid19ThData {
  Future<Covid19Th> getData() async {
    http.Response response = await http.get(Covid19Th.apiUrl);

    if (response.statusCode == 200) {
      return Covid19Th.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw 'Problem with get data from api';
    }
  }
}
