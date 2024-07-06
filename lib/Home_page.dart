import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final int activeIndex = 0;
  final int _current = 0;
  final urlImages = [
    'assets/slider.png',
    'assets/slider.png',
    'assets/slider.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget buildImage(String urlImages, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    color: Colors.grey,
    child: Image.asset(
      urlImages,
      fit: BoxFit.cover,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0x8AFFFFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for drives near you",
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Color(0xFFE64A19),
              ),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFFE64A19),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: true,
                    ),
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(urlImages, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.deepOrange[700]
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset("assets/donation.png", fit: BoxFit.cover),
                    ),
                    margin: const EdgeInsets.all(40),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset("assets/volunteer.png", fit: BoxFit.cover),
                    ),
                    margin: const EdgeInsets.all(40),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 1000, width: 1000),
                    child: ElevatedButton(
                      child: const Text('See All Categories'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        gap: 8,
        activeColor: Color(0xFFE64A19),
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.bookmark, text: 'Bookmarks'),
          GButton(icon: Icons.note, text: 'Drives'),
          GButton(icon: Icons.account_circle, text: 'Profile'),
        ],
      ),
    );
  }
}
