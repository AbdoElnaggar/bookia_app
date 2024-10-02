// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, body_might_complete_normally_nullable, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/custome_widget/custtom_bottom.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/future/home/date/model/response/get_cart_response_model/cart_item.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class wishlist_view extends StatefulWidget {
  wishlist_view({super.key, this.product});
  final Product? product;
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wishlist',
            style: gettitlestyle(context),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RemoveWishlistLoadedState) {
              Navigator.pop(context);
              context.read<HomeBloc>().add(GetWishlistEvent());
            } else if (state is RemoveWishlistLoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Lottie.asset('assets/image/loding.json');
                  });
            }
          },
          buildWhen: (previous, current) => current is WishlistLoadedState,
          builder: (context, state) {
            var wishlistBooks =
                context.read<HomeBloc>().getWishlistResponseModel?.data?.data;
            if (wishlistBooks?.isEmpty ?? false) {
              return Center(
                child: Text(
                  "No Books Add To  wishlist",
                  style: getBodyTextStyle(context),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  );
                },
                itemCount: wishlistBooks?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: wishlistBooks?[index].image ?? " ",
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
                                      wishlistBooks?[index].name ?? " ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: gettitlestyle(context),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context.read<HomeBloc>().add(
                                            RemoveWishlistEvent(
                                                product_id:
                                                    wishlistBooks?[index].id));
                                      },
                                      icon: SvgPicture.asset(
                                        Appicons.Delet_svg,
                                        height: 25,
                                        width: 25,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                wishlistBooks?[index].price ?? " ",
                                style: getBodyTextStyle(context),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // context.read<HomeBloc>().add(GetCartEvent());
                                      context.read<HomeBloc>().add(
                                          Add_To_CartEvent(
                                              product_id:
                                                  wishlistBooks?[index].id ??
                                                      ""));
                                    },
                                    child: CustomButton(
                                        height: 40,
                                        width: 190,
                                        text: 'Add to Card',
                                        onTap: () {},
                                        color: Appcolor.primary),
                                  ),
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
          },
        ));
  }
}
