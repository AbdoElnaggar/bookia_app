// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/custome_widget/custtom_bottom.dart';
import 'package:bookia_app/core/function/dialog.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class Book_details extends StatelessWidget {
  Book_details({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Appcolor.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              Appicons.Back_svg,
              height: 30,
              width: 30,
            )),
        actions: [
          SizedBox(
            width: 12,
          ),
          InkWell(
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(Add_To_WishlistEvent(product_id: product?.id ?? ""));
              },
              child: SvgPicture.asset(Appicons.Notfication_svg)),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              '  \$ ${product?.price ?? ''}',
              style: getBodyTextStyle(context, fontSize: 28),
            ),
            SizedBox(
              width: 55,
            ),
            Expanded(
                child: CustomButton(
              text: 'Add To Cart',
              onTap: () {
                context.read<HomeBloc>().add(Add_To_CartEvent(
                      product_id: product?.id ?? "",
                    ));
              },
              color: Appcolor.text_color,
            ))
          ],
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is Add_to_WishlistLoadedState) {
            Navigator.pop(context);
            showsuccessDialog(context, "Added to Wishlist Sucsses");
          } else if (state is Add_to_CartLoadedState) {
            Navigator.pop(context);
            showsuccessDialog(context, "Added to Cart Sucsses");
          } else if (state is Add_to_WishlistLoadingState ||
              state is Add_to_CartLoadingState) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Lottie.asset('assets/image/loding.json');
                });
          } else {
            showErrorDialog(context, "Something error occerd");
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: product?.id ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: product?.image ?? '',
                        height: 350,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    product?.name ?? '',
                    style: getBodyTextStyle(context, fontSize: 22),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    product?.category ?? '',
                    style: getBodyTextStyle(context, color: Appcolor.primary),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    product?.description ?? '',
                    textAlign: TextAlign.justify,
                    style: getBodyTextStyle(context),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
