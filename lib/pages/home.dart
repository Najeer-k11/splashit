import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashit/apibase/api.dart';
import 'package:splashit/models/model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashit/pages/search.dart';
import 'package:splashit/pages/wall.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<wallmodel> parsed = [];
  int cindex = 0;
  bool isloading = true;

  getdata() async {
    List<wallmodel> data = await Apibase().Randomimages();
    setState(() {
      parsed = data;
      isloading = false;
    });
  }

  @override
  void initState() {
    if (isloading) {
      getdata();
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121213),
      body: isloading
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Color(0xff121212),
                  centerTitle: false,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * 0.15,
                  toolbarHeight: 100,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/svgs/search.svg',
                        color: Colors.lightGreen,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svgs/menu.svg',
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                  pinned: true,
                  floating: true,
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Splash",
                              style: GoogleFonts.pacifico(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            Text(
                              "IT",
                              style: GoogleFonts.pacifico(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightGreen.withOpacity(0.9)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "powered by ",
                              style: GoogleFonts.manrope(
                                  fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "unsplash",
                              style: GoogleFonts.manrope(
                                  fontSize: 15, color: Colors.lightGreen),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    children: List.generate(
                      parsed.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wallpage(wi: parsed[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(top: 8)
                              : index == 1
                                  ? const EdgeInsets.only(top: 8)
                                  : const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedNetworkImage(
                              imageUrl: parsed[index].urls.full,
                              placeholder: (context, Url) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              height: parsed[index].height * 0.1,
                              width: parsed[index].width * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff121212),
            currentIndex: cindex,
            elevation: 0,
            onTap: (value) {
              setState(() {
                cindex = value;
              });
            },
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14),
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/home.svg',
                    height: 20,
                    color: cindex == 0 ? Colors.lightGreen : Colors.grey,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/bmo.svg',
                  height: 20,
                  color: cindex == 1 ? Colors.lightGreen : Colors.grey,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/cato.svg',
                    height: 20,
                    color: cindex == 2 ? Colors.lightGreen : Colors.grey,
                  ),
                  label: 'cate')
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
