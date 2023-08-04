

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:splashit/pages/wall.dart';

import '../models/model.dart';

class GridInt extends StatelessWidget {
  const GridInt({
    super.key,
    required this.trend,
  });

  final List<wallmodel> trend;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: trend.length,
        gridDelegate:
            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
        itemBuilder: (context, id) => InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallpage(wi: trend[id]),),);
          },
          child: AspectRatio(
            aspectRatio: trend[id].width / (trend[id].height),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Color.fromARGB(
                      140,
                      Random().nextInt(220),
                      Random().nextInt(220),
                      Random().nextInt(220),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(
                        image: NetworkImage(trend[id].urls.full),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
