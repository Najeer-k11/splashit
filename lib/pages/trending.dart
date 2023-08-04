import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:splashit/apibase/api.dart';
import 'package:splashit/models/model.dart';

import '../components/grid.dart';

class TrendsPage extends StatefulWidget {
  const TrendsPage({super.key});

  @override
  State<TrendsPage> createState() => _TrendsPageState();
}

class _TrendsPageState extends State<TrendsPage> {
  bool isloading = true;

  List<wallmodel> trend = [];

  @override
  void initState() {
    if (isloading) {
      fetchData();
    }
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async {
    var vals = await Apibase().Randomimages();

    setState(() {
      trend = vals;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridInt(trend: trend),
    );
  }
}