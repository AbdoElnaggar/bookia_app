// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/cart/presentation/widget/list_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class cart_view extends StatefulWidget {
  const cart_view({super.key});

  @override
  State<cart_view> createState() => _auth_viewState();
}

class _auth_viewState extends State<cart_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: gettitlestyle(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: Cartlist.length,
              itemBuilder: (BuildContext context, int index) {
                Row(
                  children: [Icon(Icons.clean_hands)],
                );
                return ListTile(
                  leading: Image.asset(
                    Cartlist[index].img!,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 160,
                  ),
                  title: Text(
                    Cartlist[index].name ?? " ",
                    style: getSmallTextStyle(context),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Cartlist[index].price ?? '',
                        style: getSmallTextStyle(context),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Appcolor.scendary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                                Cartlist[index].addsvgimg ?? ''),
                          ),
                          Text(
                            '01',
                            style: getSmallTextStyle(context),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Appcolor.scendary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                                Cartlist[index].removesvgimg ?? ''),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Expanded(
                    child: SvgPicture.asset(Cartlist[index].svgimg ?? ''),
                  ),
                );
                SizedBox(
                  height: 10,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 3,
                  color: Colors.grey,
                );
              },
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: getSmallTextStyle(context, fontSize: 20),
                      ),
                      Text(
                        '\$95',
                        style: getBodyTextStyle(context, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  custom_buttom(
                      border: Appcolor.primary,
                      text: 'Checkout',
                      backg: Appcolor.primary,
                      textcolor: Appcolor.white,
                      ontap: () {})
                ],
              ),
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
