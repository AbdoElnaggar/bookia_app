// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, annotate_overrides, unused_import

import 'dart:developer';

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/profile/presentation/block/bloc/profile_bloc.dart';
import 'package:bookia_app/future/profile/presentation/widget/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profile_view extends StatefulWidget {
  const profile_view({super.key});

  @override
  State<profile_view> createState() => _profile_viewState();
}

class _profile_viewState extends State<profile_view> {
  @override
  @override
  void initState() {
    super.initState();
    
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  Widget build(BuildContext context) {
          return BlocProvider(
            create: (context) => ProfileBloc()..add(GetProfileEvent()),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Profile",
                    style: getBodyTextStyle(context, fontSize: 24)),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/Logout.svg',
                        height: 20,
                        width: 20,
                      ))
                ],
              ),
              body: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if(state is  ProfileSuccesState){
            var profile=context.read<ProfileBloc>().profileResponseModel?.data;
                return Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(width: 20),
                        ClipOval(
                          child: Image.asset(
                            Appicons.banner,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(profile?.name ?? '',
                                style: getBodyTextStyle(context)),
                            Text(
                              profile?.email ?? '',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    profile_order(title: "MY Orders"),
                    profile_order(title: "Edit Profile"),
                    profile_order(title: "Reset Password"),
                    profile_order(title: "FAQ"),
                    profile_order(title: "Contact Us"),
                    profile_order(title: "Privacy & Terms"),
                  ],
                );
                  }
                else{
                  return SizedBox();
                }
                
                }
              ),
            ),
          );
  }
  }
