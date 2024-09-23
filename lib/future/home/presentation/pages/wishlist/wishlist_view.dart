// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, body_might_complete_normally_nullable, unused_local_variable

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/custome_widget/custtom_bottom.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class wishlist_view extends StatefulWidget {
  const wishlist_view({super.key});
  @override
  State<wishlist_view> createState() => _wishlist_viewState();
}

class _wishlist_viewState extends State<wishlist_view> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetWishlistEvent()),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Wishlist',
              style: gettitlestyle(context),
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is WishlistLoadedState) {
                var wishlistBooks = context
                    .read<HomeBloc>()
                    .getWishlistResponseModel
                    ?.data
                    ?.data;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Divider(),
                      );
                    },
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/image/image 5.png',
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "book Name",
                                          style: gettitlestyle(context),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              Appicons.Delet_svg)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$250',
                                    style: getBodyTextStyle(context),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomButton(
                                          height: 40,
                                          width: 190,
                                          text: 'Add to Card',
                                          onTap: () {},
                                          color: Appcolor.primary),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
