// ignore_for_file: prefer_const_constructors

import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int selectbanner = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(children: [
      CarouselSlider.builder(
          itemCount: 4,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/image/bannaer.png',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 0.83,
            initialPage: 0,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (value, reson) {
              setState(() {
                selectbanner = value;
              });
            },
            scrollDirection: Axis.horizontal,
          )),
      SizedBox(
        height: 10,
      ),
      SmoothPageIndicator(
          controller: PageController(
            initialPage: selectbanner,
          ), // PageController
          count: 4,
          effect: ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 7,
              radius: 7,
              activeDotColor: Appcolor.primary,
              dotColor: Appcolor.border), // your preferred effect
          onDotClicked: (index) {}),
    ])));
  }
}
