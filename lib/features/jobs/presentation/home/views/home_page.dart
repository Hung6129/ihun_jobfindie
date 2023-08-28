import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_strings.dart';
import '../../../../../configuration/constants/app_spacing.dart';
import '../../../../../core/widgets/app_appbar.dart';
import '../../../../../core/widgets/app_title_with_more.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
