import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ihun_jobfindie/shared/theme/palettes.dart';
import 'package:ihun_jobfindie/shared/theme/text_styles.dart';

import '../widgets/widgets.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 180.h,
            collapsedHeight: 50.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    AntDesign.linkedin_square,
                    size: 60,
                  ),
                  Text(
                    'LinkedIn',
                    style: TextStyles.customStyle.bold.mediumText,
                  ),
                  Text(
                    'Senior Flutter Engineer',
                    style: TextStyles.customStyle.bold.largeText,
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: TabBar(
              labelStyle: TextStyles.defaultStyle.bold,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Palettes.p5,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Description',
                ),
                Tab(
                  text: 'Company',
                ),
                Tab(
                  text: 'Reviews',
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                JobDetailDescription(),
                JobDetailAboutCompany(),
                JobDetailReview(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 30.h),
          )
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Palettes.p2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          FontAwesome.send,
          color: Palettes.textWhite,
        ),
        label: Text(
          'Apply Now',
          style: TextStyles.customStyle.mediumText.whiteText,
        ),
      ),
    );
  }
}
