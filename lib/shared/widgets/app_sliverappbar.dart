import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSilverBarWidget extends StatelessWidget {
  const AppSilverBarWidget({
    Key? key,
    required this.children,
    required this.expandedHeight,
    this.collapsedHeight,
    this.titleWidget,
    required this.onlyShowTitleWhenCollapsed,
    this.backgroundWidget,
    this.leadingWidget,
    this.actions,
    this.iconThemeData,
  }) : super(key: key);

  final List<Widget> children;
  final double expandedHeight;
  final double? collapsedHeight;
  final double toolbarHeight;
  final Widget? titleWidget;
  final bool onlyShowTitleWhenCollapsed;
  final Widget? backgroundWidget;

  final Widget? leadingWidget;
  final List<Widget>? actions;
  final IconThemeData? iconThemeData;

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: bgColor ?? context.theme.primaryColor,
          pinned: true,
          snap: true,
          floating: true,
          collapsedHeight: collapsedHeight,
          expandedHeight: expandedHeight,
          toolbarHeight: toolbarHeight,
          title: titleWidget,
          titleSpacing: 0,
          flexibleSpace: FlexibleSpaceBar(),
          leading: leadingWidget,
          actions: actions,
          actionsIconTheme: iconThemeData ?? const IconThemeData(color: Colors.white, size: 20),
        ),
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
      ],
    );
  }
}
