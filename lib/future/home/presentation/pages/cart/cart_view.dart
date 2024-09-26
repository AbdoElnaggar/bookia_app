// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, body_might_complete_normally_nullable, unused_local_variable, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, duplicate_ignore

import 'dart:developer';

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
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

class cart_view extends StatefulWidget {
  cart_view({super.key, this.product});
  final Product? product;
  @override
  State<cart_view> createState() => _cart_viewState();
}

class _cart_viewState extends State<cart_view> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wislist',
            style: gettitlestyle(context),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RemoveCartLoadedState) {
              Navigator.pop(context);
              context.read<HomeBloc>().add(GetCartEvent());
            } else if (state is RemoveCartLoadingState|| state is CartLoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Lottie.asset('assets/image/loding.json');
                  });
            }
            else if (state  is CartLoadedState) {
              Navigator.pop(context);
            }
          },
          buildWhen: (previous, current) => current is CartLoadedState,
          builder: (context, state) {
            var cartlist =
                context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
            if (cartlist?.isEmpty ?? false) {
              return Center(
                child: Text(
                  "No Books Add To Cart",
                  style: getBodyTextStyle(context),
                ),
              );
            } else {
                       return Center(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: cartlist?.length ??0,
                itemBuilder: (BuildContext context, int index) {
                  Row(
                    children: [Icon(Icons.clean_hands)],
                  );
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: cartlist?[index].itemProductImage??'',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 160,
                    ),
                    title: Text(
                      cartlist?[index].itemProductName??'',
                      maxLines: 1,
                      style: getSmallTextStyle(context),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartlist?[index].itemProductPrice??'',
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
                                  Appicons.Add_svg),
                            ),
                            Text(
                              cartlist?[index].itemQuantity.toString()??'',
                              style: getSmallTextStyle(context),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Appcolor.scendary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: (){
                                  context.read<HomeBloc>().add(RemoveCartEvent(product_id: cartlist?[index].itemProductId));
                                },
                                child: SvgPicture.asset(
                                   Appicons.Remove_svg),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: Expanded(
                      child: SvgPicture.asset(cartlist?[index].itemProductImage ?? ''),
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
                         '\$65',
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
        );
        }
              // return Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: ListView.separated(
              //     separatorBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 16),
              //         child: Divider(),
              //       );
              //     },
              //     itemCount: cartlist?.length ?? 0,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: CachedNetworkImage(
              //               imageUrl: cartlist?[index].itemProductImage ?? " ",
              //               width: 100,
              //               height: 120,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           Expanded(
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           cartlist?[index].itemProductName ?? " ",
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                           style: gettitlestyle(context),
              //                         ),
              //                       ),
              //                       IconButton(
              //                           onPressed: () {
              //                             context.read<HomeBloc>().add(
              //                                 RemoveCartEvent(
              //                                     product_id: cartlist?[index]
              //                                         .itemProductId));
              //                           },
              //                           icon: SvgPicture.asset(
              //                             Appicons.Delet_svg,
              //                             height: 25,
              //                             width: 25,
              //                           )),
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Text(
              //                     cartlist?[index].itemTotal.toString() ?? " ",
              //                     style: getBodyTextStyle(context),
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     children: [
              //                       InkWell(
              //                         // onTap: (){
              //                         //   // context.read<HomeBloc>().add(GetCartEvent());
              //                         // context.read<HomeBloc>().add(Add_To_CartEvent(product_id:cartlist?[index].itemProductId?? ""));
              //                         // },
              //                         child: CustomButton(
              //                             height: 40,
              //                             width: 190,
              //                             text: 'Add to Card',
              //                             onTap: () {},
              //                             color: Appcolor.primary),
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           )
              //         ],
              //       );
              //     },
              //   ),
              // );
            }
          ));}
       
      
  }
  
































// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, unused_label, annotate_overrides, unused_local_variable

// import 'package:bookia_app/core/custome_widget/button.dart';
// import 'package:bookia_app/core/utlis/color/colors.dart';
// import 'package:bookia_app/core/utlis/text_style.dart';
// import 'package:bookia_app/future/cart/presentation/widget/list_cart.dart';
// import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lottie/lottie.dart';

// class cart_view extends StatefulWidget {
//   const cart_view({super.key});
//   @override
  
//   State<cart_view> createState() => _auth_viewState();
// }
// class _auth_viewState extends State<cart_view> {
//   @override
//   void initState() {
//   super.initState();
//   context.read<HomeBloc>().add(GetCartEvent());
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'My Cart',
//           style: gettitlestyle(context),
//         ),
//       ),
//       body: BlocConsumer<HomeBloc,HomeState>(
//          listener: (context, state) {
//             if (state is RemoveCartLoadedState) {
//               Navigator.pop(context);
//               context.read<HomeBloc>().add(GetCartEvent());
//             } else if (state is RemoveCartLoadingState) {
//               showDialog(
//                   context: context,
//                   barrierDismissible: false,
//                   builder: (context) {
//                     return Lottie.asset('assets/image/loding.json');
//                   });
//             }
            
//           },
//           buildWhen: (previous, current) => current is  CartLoadedState ,
//         builder: (context, state){
//           var cart=context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
//         if (cart?.isEmpty ?? false) {
            //   return Center(
            //     child: Text(
            //       "No Books Add To Cart",
            //       style: getBodyTextStyle(context),
            //     ),
            //   );
            // }

        //  return Center(
        //   child: Column(
        //     children: [
        //       ListView.separated(
        //         shrinkWrap: true,
        //         itemCount: cart?.length ??0,
        //         itemBuilder: (BuildContext context, int index) {
        //           Row(
        //             children: [Icon(Icons.clean_hands)],
        //           );
        //           return ListTile(
        //             leading: CachedNetworkImage(
        //               imageUrl: cart?[index].itemProductImage??'',
        //               fit: BoxFit.cover,
        //               width: 100,
        //               height: 160,
        //             ),
        //             title: Text(
        //               cart?[index].itemProductName??'',
        //               maxLines: 1,
        //               style: getSmallTextStyle(context),
        //             ),
        //             subtitle: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   cart?[index].itemProductPrice??'',
        //                   style: getSmallTextStyle(context),
        //                 ),
        //                 Row(
        //                   children: [
        //                     Container(
        //                       padding: EdgeInsets.all(10),
        //                       margin: EdgeInsets.all(5),
        //                       decoration: BoxDecoration(
        //                         color: Appcolor.scendary,
        //                         borderRadius: BorderRadius.circular(10),
        //                       ),
        //                       child: SvgPicture.asset(
        //                           Cartlist[index].addsvgimg ?? ''),
        //                     ),
        //                     Text(
        //                       cart?[index].itemQuantity.toString()??'',
        //                       style: getSmallTextStyle(context),
        //                     ),
        //                     Container(
        //                       padding: EdgeInsets.all(15),
        //                       margin: EdgeInsets.all(5),
        //                       decoration: BoxDecoration(
        //                         color: Appcolor.scendary,
        //                         borderRadius: BorderRadius.circular(10),
        //                       ),
        //                       child: InkWell(
        //                         onTap: (){
        //                           context.read<HomeBloc>().add(RemoveCartEvent(item_id:cart?[index].itemId));
        //                         },
        //                         child: SvgPicture.asset(
        //                             Cartlist[index].removesvgimg ?? ''),
        //                       ),
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             ),
        //             trailing: Expanded(
        //               child: SvgPicture.asset(Cartlist[index].svgimg ?? ''),
        //             ),
        //           );
        //           SizedBox(
        //             height: 10,
        //           );
        //         },
        //         separatorBuilder: (BuildContext context, int index) {
        //           return Divider(
        //             thickness: 2,
        //             indent: 10,
        //             endIndent: 3,
        //             color: Colors.grey,
        //           );
        //         },
        //       ),
        //       Spacer(
        //         flex: 2,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   'Total',
        //                   style: getSmallTextStyle(context, fontSize: 20),
        //                 ),
        //                 Text(
        //                  '\$65',
        //                   style: getBodyTextStyle(context, fontSize: 20),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 12,
        //             ),
        //             custom_buttom(
        //                 border: Appcolor.primary,
        //                 text: 'Checkout',
        //                 backg: Appcolor.primary,
        //                 textcolor: Appcolor.white,
        //                 ontap: () {})
        //           ],
        //         ),
        //       ),
        //       Spacer(
        //         flex: 3,
        //       )
        //     ],
        //   ),
        // );
        // }
//         else{
// return Center(child:Text("No item Found",style: getBodyTextStyle(context),),);
//         }
           
//         },
//       ),
//     );
//   }
// }


