import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    super.key,
    required this.children,
    required this.expandedHeight,
    this.collapsedHeight,
    this.titleWidget,
    required this.onlyShowTitleWhenCollapsed,
    this.backgroundWidget,
    this.leadingWidget,
    this.actions,
    this.iconThemeData,
    this.flexibleSpaceBar,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.pinned = true,
    this.leadingWidth,
    this.onStretchTrigger,
    this.bottom,
    this.backgroundColor,
  });

  final List<Widget> children;
  final double expandedHeight;
  final double? collapsedHeight;
  final Widget? titleWidget;
  final bool onlyShowTitleWhenCollapsed;
  final Widget? backgroundWidget;

  final Widget? leadingWidget;
  final List<Widget>? actions;
  final IconThemeData? iconThemeData;

  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final bool? pinned;

  final double? leadingWidth;

  final FlexibleSpaceBar? flexibleSpaceBar;

  final Function? onStretchTrigger;

  final PreferredSizeWidget? bottom;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          bottom: bottom,
          backgroundColor: backgroundColor ?? Colors.black,
          leading: leadingWidget,
          actions: actions,
          leadingWidth: leadingWidth?.toDouble(),
          automaticallyImplyLeading: automaticallyImplyLeading!,
          iconTheme: iconThemeData,
          expandedHeight: expandedHeight,
          collapsedHeight: collapsedHeight,
          pinned: pinned!,
          floating: false,
          snap: false,
          stretch: true,
          onStretchTrigger: () async {
            onStretchTrigger == null ? null : onStretchTrigger!();
          },
          flexibleSpace: flexibleSpaceBar,
        ),
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
      ],
    );
  }
}
