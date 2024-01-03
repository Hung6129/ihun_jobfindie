// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';
// import 'package:ihun_jobfindie/configuration/data/network/nets/app_exception.dart';
// import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
// import 'package:ihun_jobfindie/shared/widgets/app_loading_indicator.dart';
// import 'package:logger/logger.dart';

// abstract class AppListController<BM> extends GetxController {
//   final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));
//   // late final ReachabilityService _reachabilityService = Get.find();

//   Rxn<List<BM>> data = Rxn();
//   Rxn<AppException> appException = Rxn<AppException>();
//   Rx<int> total = Rx(0);
//   Rx<bool> hasMore = Rx(false);

//   // Todo: remove isLoading in here
//   Rx<bool> isLoading = Rx(false);

//   Rxn<List<BM>> offlineData = Rxn();

//   Future<void> fetchOfflineItems() async {}

//   int _page = 1;
//   bool _isLocalFilterOffline = true;
//   bool _isLocalFilterOnline = true;

//   Future<AppResult<List<BM>>> onCall(int page);

//   Future<void> onFinishLoading() async {}

//   @override
//   void onReady() {
//     super.onReady();
//     if (!skipInitFetching()) {
//       initFetch();
//     }
//   }

//   void initFetch() async {
//     /// get offline data first
//     await fetchOfflineItems();
//     if (_isLocalFilterOnline && _reachabilityService.isAppOnlineMode()) {
//       AppFullScreenLoadingIndicator.show();
//       isLoading.value = true;
//       final response = await onCall(_page);
//       AppFullScreenLoadingIndicator.dismiss();
//       if (response is AppResultSuccess<List<BM>>) {
//         _updateDataWith(response.netData, resetData: true);
//         total.value = response.total ?? 0;
//         hasMore.value = response.hasMore;
//         appException.value = null;
//         _logger.i('AppListWidget Init Call: Data length ${data.value?.length} --- summary: ${total.value}');
//       }
//       if (response is AppResultFailure) {
//         appException.value = (response as AppResultFailure).exception;
//         _forceLogout(appException.value);
//       }
//       isLoading.value = false;
//       onFinishLoading.call();
//     } else {
//       _updateDataWith(null, resetData: true);
//       total.value = offlineData.value?.length ?? 0;
//       appException.value = null;
//       hasMore.value = false;
//       isLoading.value = false;
//       onFinishLoading.call();
//     }
//   }

//   Future<void> onRefreshCall() async {
//     _page = 1;

//     /// get offline data first
//     await fetchOfflineItems();

//     if (_isLocalFilterOnline && _reachabilityService.isAppOnlineMode()) {
//       isLoading.value = true;
//       final response = await onCall(_page);
//       if (response is AppResultSuccess<List<BM>>) {
//         _updateDataWith(response.netData, resetData: true);
//         total.value = response.total ?? 0;
//         hasMore.value = response.hasMore;
//         appException.value = null;
//         _logger.i('AppListWidget Refresh: Data length ${data.value?.length} --- summary: ${total.value}');
//       }
//       if (response is AppResultFailure) {
//         appException.value = (response as AppResultFailure).exception;
//         _forceLogout(appException.value);
//       }
//       isLoading.value = false;
//     } else {
//       _updateDataWith(null, resetData: true);
//       hasMore.value = false;
//     }
//   }

//   Future<void> onRefreshCallWithLoading() async {
//     AppFullScreenLoadingIndicator.show();
//     await onRefreshCall();
//     AppFullScreenLoadingIndicator.dismiss();
//   }

//   Future<void> onLoadMoreCall() async {
//     _page = _page + 1;
//     isLoading.value = true;
//     final response = await onCall(_page);
//     if (response is AppResultSuccess<List<BM>>) {
//       _updateDataWith(response.netData, resetData: false);
//       total.value = response.total ?? 0;
//       hasMore.value = response.hasMore;
//       appException.value = null;
//     }
//     if (response is AppResultFailure) {
//       appException.value = (response as AppResultFailure).exception;
//       _forceLogout(appException.value);
//     }
//     isLoading.value = false;
//   }

//   void _updateDataWith(List<BM>? networkData, {required bool resetData}) {
//     if (resetData) {
//       data.value = _isLocalFilterOffline ? [...offlineData.value ?? List.empty()] : List.empty();
//     }

//     if (!_isLocalFilterOnline) return;

//     if (offlineData.value != null && offlineData.value!.isNotEmpty) {
//       if ((offlineData.value is List<ConfirmFinalizePriceModel>) && (networkData is List<ConfirmFinalizePriceModel>?)) {
//         final offlineItemIds = [
//           ...(offlineData.value as List<ConfirmFinalizePriceModel>).map((e) => e.objectIdentify).toList()
//         ];
//         final newData = networkData as List<ConfirmFinalizePriceModel>? ?? List.empty();
//         data.value = [
//           ...(data.value ?? List.empty()),
//           ...(newData.where((item) => !offlineItemIds.contains(item.objectIdentify)).toList() as List<BM>)
//         ];
//       }

//       if ((offlineData.value is List<PurchaseTransportDetailGroupModel>) &&
//           (networkData is List<PurchaseTransportDetailGroupModel>?)) {
//         // thu mua vận chuyển
//         final offlineItemIds = [
//           ...(offlineData.value as List<PurchaseTransportDetailGroupModel>).map((e) => e.objectIdentify).toList()
//         ];
//         final newData = networkData as List<PurchaseTransportDetailGroupModel>? ?? List.empty();
//         data.value = [
//           ...(data.value ?? List.empty()),
//           ...(newData.where((item) => !offlineItemIds.contains(item.objectIdentify)).toList() as List<BM>)
//         ];
//       }
//     } else {
//       data.value = [...(data.value ?? List.empty()), ...(networkData ?? List.empty())];
//     }
//   }

//   void updateLocalFilterData({bool isFilterOffline = false, bool isFilterOnline = true}) {
//     _isLocalFilterOffline = isFilterOffline;
//     _isLocalFilterOnline = isFilterOnline;
//   }

//   void _forceLogout(AppException? appException) async {
//     if (appException?.code == HttpStatus.unauthorized) {
//       // Force Logout
//       Get.find<AppService>().forceLogout();
//       return;
//     }
//   }

//   bool skipInitFetching() => false;
// }
