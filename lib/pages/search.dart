import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashit/apibase/api.dart';
import 'package:splashit/components/grid.dart';

import '../models/model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<wallmodel> parsed = [];

  TextEditingController scnt = TextEditingController();

  void searchmage(String query) async {
    List<wallmodel> data = await Apibase().Searchimages(query);
    setState(() {
      parsed = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        elevation: 0.2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextField(
          controller: scnt,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          onChanged: (value) {
            searchmage(scnt.text);
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'search here',
            focusColor: Theme.of(context).primaryColor,
            hintStyle: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.2)),
            labelStyle: TextStyle(color: Colors.grey[100]),
            suffixIcon: IconButton(
              onPressed: () {
                searchmage(scnt.text);
              },
              icon: SvgPicture.asset('assets/svgs/search.svg',color: Theme.of(context).primaryColor,),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GridInt(trend: parsed)
    );
  }
}
