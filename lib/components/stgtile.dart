

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class stgTile extends StatelessWidget {
  void Function()? ontap;
  Color col;
  String txt;

stgTile({super.key, required this.col,required this.txt,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical:6 ),
        duration:const Duration(seconds: 1),
        curve: Curves.easeIn,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            txt,
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              shadows: [
                const BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
