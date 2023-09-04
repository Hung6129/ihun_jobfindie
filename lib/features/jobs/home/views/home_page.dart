import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import 'package:ihun_jobfindie/features/jobs/home/widgets/widgets.dart';

import 'package:ihun_jobfindie/shared/widgets/app_appbar.dart';
import 'package:ihun_jobfindie/shared/widgets/app_title_with_more.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildPreferredSizeWidget(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchWithFilter(),
              AppTitleWithMore(
                title: homeSuggestions,
                onPressed: () {},
              ),
              const SuggestedJobCarouselList(),
              verticalMargin16,
              AppTitleWithMore(
                title: homeRecentJobs,
                onPressed: () {},
              ),
              const RecentJobList()
            ],
          ),
        ));
  }
}
