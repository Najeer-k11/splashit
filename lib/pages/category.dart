import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashit/apibase/api.dart';
import 'package:splashit/components/grid.dart';
import 'package:splashit/models/model.dart';

class CategoryViewer extends StatefulWidget {


  final String link;


  CategoryViewer({super.key, required this.link});

  @override
  State<CategoryViewer> createState() => _CategoryViewerState();
}

class _CategoryViewerState extends State<CategoryViewer> {


  List<wallmodel> output = [];
  bool isloading = true;

  @override
  void initState() {
    if(isloading){
      fetchCatWallpapers(widget.link);
    }
    // TODO: implement initState
    super.initState();
  }


  void fetchCatWallpapers( String link ) async {
    var data = await Catbase().categoryImages(link);

    setState(() {
      output =  data;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  Text(
          '${output.length.toString()} wallpapers',
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor
            ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: isloading ?const Center(
        child: CircularProgressIndicator(),
      ): GridInt(trend: output),
    );
  }
}