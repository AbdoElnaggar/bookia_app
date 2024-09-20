// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Book_details extends StatelessWidget {
   Book_details({super.key, this.product});
final Product?product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              
            children: [
              SizedBox(height: 30,),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product?.image??'',
                  height: 250,
                  
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                product?.name??'',
                style: getBodyTextStyle(context,fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                product?.category??'',
                style: getBodyTextStyle(context,color: Appcolor.primary),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                product?.description??'',
                style: getBodyTextStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
