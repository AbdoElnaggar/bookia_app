// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_type_check

import 'dart:developer';

import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/future/home/presentation/pages/bookdetails/book_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class best_seller_widget extends StatelessWidget {
  const best_seller_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is BestSellerHomeLoadedState ||current is BestSellerHomeLoadingState,
      builder: (context, state) {
        if (state is BestSellerHomeLoadedState) {
          var books = context.read<HomeBloc>().bestSellerResponseModel?.data;
          log(state.toString());
          return GridView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //mainAxisExtent: 10,
                // crossAxisSpacing: 10,
                mainAxisExtent: 300,
                crossAxisCount: 2,
              ),
              itemCount: books?.products?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    push(
                        context,
                        Book_details(
                          product: books?.products?[index],
                        ));
                  },
                  child: Container(
                    //height: 280,
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.scendary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Hero(
                            tag: books?.products?[index].id ?? '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: books?.products?[index].image ?? '',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          books?.products?[index].name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyTextStyle(context),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '  \$ ${books?.products?[index].price ?? " "}',
                                style: getBodyTextStyle(context),
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  //  maximumSize: Size(100, 35),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
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
                  ),
                );
              });
        } else {
          return const Center();
        }
      },
    );
  }
}
