import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/shared/styles/text_styles.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palettes.textWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              GestureDetector(
                onTap: () {},
                child: Badge(
                  child: Icon(
                    FontAwesome.bell,
                    color: Colors.white,
                  ),
                ),
              ),
              horizontalMargin24
            ],
            backgroundColor: Palettes.textWhite,
            expandedHeight: 100.h,
            toolbarHeight: 100.h,
            pinned: true,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/profile');
                  },
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/474x/68/e5/d3/68e5d30de3741f077cea06f1b1a12a34.jpg',
                    ),
                  ),
                ),
                horizontalMargin12,
                Text('Hi, John Doe', style: TextStyles.defaultStyle.appBarTitle.whiteText),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palettes.p2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Palettes.p5,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/474x/68/e5/d3/68e5d30de3741f077cea06f1b1a12a34.jpg',
                        ),
                      ),
                      horizontalMargin12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: TextStyles.defaultStyle.appBarTitle),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
              shrinkWrap: true,
            )
          ]))
        ],
      ),
    );
  }
}
