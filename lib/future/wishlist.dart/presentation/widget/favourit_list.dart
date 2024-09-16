// // ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Favoirtmodel {
  String? name;
  String? img;
  String? svgimg;
  String? price;
  String? time;
  IconData? icon;
  IconData? icons;
  Favoirtmodel({this.name, this.img, this.price, this.svgimg});
}

List<Favoirtmodel> userlist = [
  Favoirtmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
  ),
  Favoirtmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
  ),
  Favoirtmodel(
    name: 'The Republic',
    img: 'assets/image/image 5.png',
    price: '\$280.00',
    svgimg: 'assets/icons/Shape.svg',
  ),
];
