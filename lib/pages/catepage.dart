import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashit/apibase/api.dart';
import 'package:splashit/models/catemodel.dart';
import 'package:splashit/pages/category.dart';

class CatePage extends StatefulWidget {
  const CatePage({super.key});

  @override
  State<CatePage> createState() => _CatePageState();
}

class _CatePageState extends State<CatePage> {
  List<CategoryModel> categorylist = [];

  bool isloading = true;

  @override
  void initState() {
    if (isloading) {
      fetchCategory();
    }
    // TODO: implement initState
    super.initState();
  }

  void fetchCategory() async {
    var data = await Catbase().getCate();

    setState(() {
      categorylist = data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: GoogleFonts.inder(color: Theme.of(context).primaryColor),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : StaggeredGrid.count(
              crossAxisCount: 3,
              axisDirection: AxisDirection.down,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              children: List.generate(
                categorylist.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryViewer(link: categorylist[index].link),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(
                          150,
                          Random().nextInt(220),
                          Random().nextInt(220),
                          Random().nextInt(220),
                        ),
                        borderRadius: BorderRadius.circular(0)),
                    child: Center(
                      child: Text(
                        categorylist[index].name,
                        style: GoogleFonts.inter(
                            color: Colors.black, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
