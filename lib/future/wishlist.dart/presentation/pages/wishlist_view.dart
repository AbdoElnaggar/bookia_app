// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/favourit_list.dart';

class wishlist_view extends StatelessWidget {
  const wishlist_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorites Books',
          style: gettitlestyle(context),
        ),
      ),
      body: ListView.separated(
        itemCount: userlist.length,
        itemBuilder: (BuildContext context, int index) {
          Row(
            children: [Icon(Icons.clean_hands)],
          );
          return ListTile(
            leading: Image.asset(
              userlist[index].img!,
              fit: BoxFit.cover,
              width: 100,
              height: 160,
            ),
            title: Text(
              userlist[index].name ?? " ",
              style: getSmallTextStyle(context),
            ),
            subtitle: Text(
              userlist[index].price ?? '',
              style: getSmallTextStyle(context),
            ),
            trailing: Column(
              children: [
                SvgPicture.asset(userlist[index].svgimg ?? ''),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    margin: EdgeInsets.only(bottom: 10, top: 8),
                    decoration: BoxDecoration(
                      color: Appcolor.primary,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: getSmallTextStyle(context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                )
              ],
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
    );
  }
}
