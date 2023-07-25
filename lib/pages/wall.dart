
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashit/models/model.dart';
import 'package:circular_progress_bar/circular_progress_bar.dart';

class Wallpage extends StatefulWidget {
  final wallmodel wi;

  Wallpage({required this.wi});

  @override
  State<Wallpage> createState() => _WallpageState();
}

class _WallpageState extends State<Wallpage> {

  double Progress = 0;
  bool isdownloading = false;
  bool isdownloadingfinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        Container(
          height: double.infinity,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xf121212),
            image: DecorationImage(
                image: NetworkImage(widget.wi.urls.full), fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () async { 
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
                    Visibility(
                      visible: isdownloading,
                      child: CircularProgressBar(width: 30, height: 30, radius: 5, percentage: Progress, color: Colors.white,))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],),
    );
  }

}
