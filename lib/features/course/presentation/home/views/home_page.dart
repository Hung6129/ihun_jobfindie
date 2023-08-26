import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/features/course/presentation/home/widgets/recent_job_list.dart';
import 'package:ihun_jobfindie/features/course/presentation/home/widgets/suggested_job_carousel_list.dart';

import '../../../../../core/widgets/app_appbar.dart';
import '../widgets/search_with_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildPreferredSizeWidget(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SearchWithFilter(),
              SuggestedJobCarouselList(),
              
              RecentJobList()
            ],
          ),
        ));
  }
}
