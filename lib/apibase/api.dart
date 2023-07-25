import 'dart:convert';

import 'package:splashit/models/model.dart';
import 'package:http/http.dart' as http;

String link =
    'https://api.unsplash.com/photos?count=30&client_id=Odh8nQzKbHvqGHEW8UbCU6kxOnalWvdmAGn34Uy3pYs';

class Apibase {
  Future<List<wallmodel>> Randomimages() async {
    List<wallmodel> parsed = [];
    int i;
    var response = await http.get(Uri.parse(link));
    List data = jsonDecode(response.body);
    for (i = 0; i < data.length; i++) {
      wallmodel wm;
      wm = wallmodel.fromJson(data[i]);
      parsed.add(wm);
    }
    return parsed;
  }

  Future<List<wallmodel>> Searchimages(String hint) async {
    List<wallmodel> parsed = [];
    String slink =
        'https://api.unsplash.com/search/photos?page=1&client_id=Odh8nQzKbHvqGHEW8UbCU6kxOnalWvdmAGn34Uy3pYs&query=$hint>';

    int i;
    var response = await http.get(Uri.parse(slink));
    Map<String, dynamic> object = jsonDecode(
      response.body.toString(),
    );
    List data = object['results'];
    for (i = 0; i < data.length; i++) {
      wallmodel wm;
      wm = wallmodel.fromJson(data[i]);
      parsed.add(wm);
    }
    return parsed;
  }
}
