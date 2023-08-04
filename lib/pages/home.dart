import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashit/components/stgtile.dart';
import 'package:splashit/pages/catepage.dart';
import 'package:splashit/pages/search.dart';
import 'package:splashit/pages/trending.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = true;

  @override
  void initState() {
    if (isloading) {
      setState(() {
        isloading = false;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svgs/ham.svg',
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const SearchPage(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/svgs/search.svg',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: isloading
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: mq.height * 0.05,
                    ),
                    Text(
                      'Splashit',
                      style: GoogleFonts.pacifico(
                          color: Theme.of(context).primaryColor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'An UNSPLASH Client',
                      style: GoogleFonts.inter(
                        color: Theme.of(context).primaryColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    stgTile(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrendsPage(),
                            ),
                          );
                        },
                        col: Colors.redAccent.withOpacity(0.8),
                        txt: 'Trending'),
                    stgTile(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CatePage(),
                            ),
                          );
                        },
                        col: Colors.greenAccent.withOpacity(0.8),
                        txt: 'Categories'),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    stgTile(
                        ontap: () {
                          Fluttertoast.showToast(msg: 'under development');
                        },
                        col: Colors.blueAccent.withOpacity(0.8),
                        txt: 'best Photographers'),
                    stgTile(
                        ontap: () {
                          Fluttertoast.showToast(msg: 'under development');
                        },
                        col: Colors.orangeAccent.withOpacity(0.8),
                        txt: 'Ontop'),
                  ],
                ),
              ],
            ),
      extendBody: true,
    );
  }
}
