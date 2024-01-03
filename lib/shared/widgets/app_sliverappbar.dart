import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSilverBarWidget extends StatelessWidget {
  const AppSilverBarWidget({
    Key? key,
    required this.children,
    required this.expandedHeight,
    this.collapsedHeight,
    this.titleWidget,
    this.backgroundWidget,
    this.leadingWidget,
    this.actions,
    this.iconThemeData,
    required this.toolbarHeight,
    this.bgColor,
    this.pinned,
    this.snap,
    this.floating,
  }) : super(key: key);

  final List<Widget> children;
  final double expandedHeight;
  final double? collapsedHeight;
  final double toolbarHeight;
  final Widget? titleWidget;
  final Widget? backgroundWidget;

  final Widget? leadingWidget;
  final List<Widget>? actions;
  final IconThemeData? iconThemeData;

  final Color? bgColor;

  final bool? pinned;
  final bool? snap;
  final bool? floating;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: bgColor ?? context.theme.primaryColor,
          pinned: pinned ?? true,
          snap: snap ?? false,
          floating: floating ?? false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
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
