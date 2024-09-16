// // ignore_for_file: unused_import

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:flutter/material.dart';

class Cartmodel {
  String? name;
  String? img;
  String? svgimg;
  String? addsvgimg;
  String? removesvgimg;
  String? price;
  String? time;
  IconData? icon;
  IconData? icons;
  Cartmodel(
      {this.name,
      this.img,
      this.price,
      this.addsvgimg,
      this.removesvgimg,
      this.svgimg});
}

List<Cartmodel> Cartlist = [
  Cartmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
    addsvgimg: Appicons.Add_svg,
    removesvgimg: Appicons.Remove_svg,
  ),
  Cartmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
    addsvgimg: Appicons.Add_svg,
    removesvgimg: Appicons.Remove_svg,
  ),
  Cartmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
    addsvgimg: Appicons.Add_svg,
    removesvgimg: Appicons.Remove_svg,
  ),
];
