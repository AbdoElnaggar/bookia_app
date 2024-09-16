// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/future/cart/presentation/pages/cart_view.dart';
import 'package:bookia_app/future/home/presentation/pages/home_view.dart';
import 'package:bookia_app/future/profile/presentation/pages/profile_view.dart';
import 'package:bookia_app/future/wishlist.dart/presentation/pages/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectindex = 0;
  List<Widget> pages = [
    home_view(),
    wishlist_view(),
    cart_view(),
    profile_view(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectindex],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Appcolor.primary,
            unselectedItemColor: Appcolor.text_color,
            currentIndex: selectindex,
            onTap: (value) {
              setState(() {
                selectindex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.Home_svg),
                  activeIcon: SvgPicture.asset(
                    Appicons.Home_svg,
                    color: Appcolor.primary,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.Notfication_svg),
                  activeIcon: SvgPicture.asset(
                    Appicons.Notfication_svg,
                    color: Appcolor.primary,
                  ),
                  label: 'search'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.Carg_svg),
                  activeIcon: SvgPicture.asset(
                    Appicons.Carg_svg,
                    color: Appcolor.primary,
                  ),
                  label: 'notifications'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.Profile_svg),
                  activeIcon: SvgPicture.asset(
                    Appicons.Profile_svg,
                    color: Appcolor.primary,
                  ),
                  label: 'person'),
            ]),
      ),
    );
  }
}
