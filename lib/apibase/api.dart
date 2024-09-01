import 'dart:convert';

import 'package:splashit/models/model.dart';
import 'package:http/http.dart' as http;

import '../models/catemodel.dart';

String link =
    'https://api.unsplash.com/topics/wallpapers/photos?count=30&client_id=<yours_apikey>';

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



class Catbase {

  List<String> cats = [
    'wallpapers',
    '3d-renders',
    'nature',
    'textures-patterns',
    'architecture-interior',
    'film',
    'street-photography',
    'experimental',
    'animals',
    'fashion-beauty',
    'business-work',
    'travel',
    'people',
    'spirituality'
  ];


  List<CategoryModel> out = [];

  Future<List<CategoryModel>> getCate() async {

    for(int i = 0; i < cats.length; i++){
      String link = 'https://api.unsplash.com/topics/${cats[i]}/photos?count=30&client_id=Odh8nQzKbHvqGHEW8UbCU6kxOnalWvdmAGn34Uy3pYs';

      CategoryModel cate = CategoryModel(link: link, name: cats[i]);

      out.add(cate);
    }


    return out;
  }

  Future<List<wallmodel>> categoryImages(String kil) async {

    List<wallmodel> parsed = [];
    int i;
    var response = await http.get(Uri.parse(kil));
    List data = jsonDecode(response.body);
    for (i = 0; i < data.length; i++) {
      wallmodel wm;
      wm = wallmodel.fromJson(data[i]);
      parsed.add(wm);
    }
    return parsed;
  }




}
