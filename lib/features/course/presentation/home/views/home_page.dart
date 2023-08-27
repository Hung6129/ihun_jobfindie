import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/styles/palettes.dart';
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
        appBar: buildPreferredSizeWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchWithFilter(),
              AppTitleWithMore(
                title: 'Suggested Jobs for You',
                onPressed: () {},
              ),
              const SuggestedJobCarouselList(),
              AppTitleWithMore(
                title: 'Recent Jobs',
                onPressed: () {},
              ),
              const RecentJobList()
            ],
          ),
        ));
  }
}
