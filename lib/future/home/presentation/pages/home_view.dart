// ignore_for_file: camel_case_types, prefer_const_constructors, unused_element, unused_import

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/future/home/presentation/widget/banner_home.dart';
import 'package:bookia_app/future/home/presentation/widget/best_seller.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetBestSallerEvent()),
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Appcolor.white,
            automaticallyImplyLeading: false,
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
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBanner(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Popular Books",
                    style: getBodyTextStyle(context, fontSize: 22),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  best_seller_widget(),
                ],
              ),
            ),
          )),
    );
  }
}
