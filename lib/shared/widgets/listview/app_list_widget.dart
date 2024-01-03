// // [AppListWidget] must to child of AppMainNavigateWidget
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ihun_jobfindie/shared/styles/palettes.dart';
// import 'package:ihun_jobfindie/shared/widgets/listview/app_list_widget_controller.dart';
// import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

// class AppListWidget<BM> extends StatelessWidget {
//   AppListWidget(
//       {required this.childWidget,
//       required this.mainController,
//       required this.mainTag,
//       this.scrollDirection = Axis.vertical,
//       this.reverse = false,
//       this.scrollController,
//       this.physics = const AlwaysScrollableScrollPhysics(),
//       this.emptyWidget,
//       this.topWidget,
//       Key? key})
//       : super(key: key);

//   final AppListController<BM> mainController;
//   final String mainTag;
//   final Widget Function(BuildContext, BM? model, int index) childWidget;
//   final Axis scrollDirection;
//   final bool reverse;
//   final ScrollController? scrollController;
//   final ScrollPhysics physics;
//   final Widget? emptyWidget;
//   final Widget? topWidget;

//   final RefreshController _refreshController = RefreshController(initialRefresh: false);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AppListController<BM>>(
//         init: mainController,
//         tag: mainTag,
//         builder: (controller) {
//           return Obx(
//             () => SmartRefresher(
//               enablePullDown: true,
//               enablePullUp: true,
//               header: const MaterialClassicHeader(),
//               footer: const ClassicFooter(
//                 loadStyle: LoadStyle.ShowWhenLoading,
//               ),
//               controller: _refreshController,
//               onRefresh: () => _onRefresh(controller),
//               onLoading: () => _onLoadMore(controller),
//               child: controller.appException.value != null
//                   ? _retry(context, controller)
//                   : (controller.data.value?.isEmpty == true
//                       ? Container(
//                           color: Palettes.textWhite,
//                           alignment: Alignment.center,
//                           child: (emptyWidget ??
//                               Center(
//                                 child: Text('No Data'),
//                               )),
//                         )
//                       : ListView.builder(
//                           controller: scrollController,
//                           scrollDirection: scrollDirection,
//                           reverse: reverse,
//                           physics: physics,
//                           cacheExtent: 9999, // caching about 125 items
//                           itemCount: (controller.data.value?.length ?? 0) + (topWidget != null ? 1 : 0),
//                           itemBuilder: (ctx, index) {
//                             if (topWidget != null && index == 0) {
//                               return topWidget!;
//                             }
//                             final correctIndex = topWidget != null ? index - 1 : index;
//                             return childWidget.call(ctx, controller.data.value?[correctIndex], correctIndex);
//                           },
//                         )),
//             ),
//           );
//         });
//   }

//   Widget _retry(BuildContext context, AppListController<BM> controller) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: Text(
//             controller.appException.value?.message ?? '',
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(
//           width: 120,
//           child: TextButton(
//             onPressed: () => controller.initFetch(),
//             child: Text('Retry'),
//           ),
//         )
//       ],
//     );
//   }

//   void _onRefresh(AppListController<BM> controller) async {
//     await controller.onRefreshCall();
//     // Always allow pull to refresh
//     _refreshController.refreshToIdle();
//   }

//   void _onLoadMore(AppListController<BM> controller) async {
//     if (controller.hasMore.value == false) {
//       _refreshController.loadComplete();
//       return;
//     }
//     await controller.onLoadMoreCall();
//     _refreshController.loadComplete();
//   }
// }
