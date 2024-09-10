// ignore_for_file: camel_case_types, prefer_const_constructors, unused_element

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  int selectbanner = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Appicons.Logo,
          height: 30,
        ),
        actions: [
          SvgPicture.asset(Appicons.Search_svg),
          SizedBox(
            width: 12,
          ),
          SvgPicture.asset(Appicons.Notfication_svg),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 4,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/image/bannaer.png',
                                height: 150,
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
            GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 280,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Appcolor.scendary,
                      
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                           'assets/image/Mask group.png',height: 280,
                              ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "The Republic",
                          style: getBodyTextStyle(context),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$250'),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolor.text_color,
                                ),
                                onPressed: () {},
                                child: Text(
                                  '  Buy  ',
                                  style: getSmallTextStyle(context,
                                      color: Appcolor.white),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
