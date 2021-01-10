import 'package:flutter/material.dart';
import 'package:coffeeon/views/detail/detail_view.dart';
import 'package:coffeeon/model/coffee_model_list.dart';
import 'package:coffeeon/constants/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:toast/toast.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'CoffeeON',
                      style: TextStyle(
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Discover Ice Coffee Shop',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0x7cdbf1ff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: coffeeBrandList.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailView(
                              brand: coffeeBrandList[index],
                              /* coffeeBrand: coffeeBrandList[index], */
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: 380,
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Hero(
                                    tag: coffeeBrandList[index].name,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      child: Image.asset(
                                        "${coffeeBrandList[index].imageAsset}",
                                        height: 220,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: AutoSizeText(
                                      coffeeBrandList[index].name,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: AutoSizeText(
                                      coffeeBrandList[index].location,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: AutoSizeText(
                                      coffeeBrandList[index].rangePrice,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/menu_icon.png'),
              onPressed: () {
                Toast.show("Menu feature for future release", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/search_icon.png'),
              onPressed: () {
                Toast.show("Search feature for future release", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_icon.png'),
              onPressed: () {
                Toast.show("Profile feature for future release", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              },
            ),
          ],
        ),
      ),
    );
  }
}
