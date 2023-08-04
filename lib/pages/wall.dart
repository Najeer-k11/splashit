import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver_v3/image_gallery_saver.dart';
import 'package:splashit/models/model.dart';


class Wallpage extends StatefulWidget {
  final wallmodel wi;

  Wallpage({required this.wi});

  @override
  State<Wallpage> createState() => _WallpageState();
}

class _WallpageState extends State<Wallpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          Container(
            height: double.infinity,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              image: DecorationImage(
                  image: NetworkImage(widget.wi.urls.full), fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.lightGreen,
                  ),
                  onPressed: () async {
                    save(widget.wi.links.download, widget.wi.name);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Download',
                        style: GoogleFonts.manrope(
                            fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/svgs/download.svg',
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  save(String dwn,String name) async{

    var response = await Dio().get( dwn,
           options: Options(responseType: ResponseType.bytes));
    await ImageGallerySaver.saveImage(
           Uint8List.fromList(response.data),
           quality: 100,
           name: name);
    Fluttertoast.showToast(msg: 'wallpaper downloading');

  }
}
