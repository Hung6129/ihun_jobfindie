// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:thannong/app/config/theme/app_theme.dart';

// import '../app/components/main/button/app_filled_button_widget.dart';
// import '../app/components/main/button/app_outlined_button_widget.dart';
// import '../app/components/main/dialog/app_dialog_default_widget.dart';
// import '../app/config/translations/strings_enum.dart';

// class DialogUtil {
//   DialogUtil._();

//   static void onDialogError(
//     BuildContext? context, {
//     required String title,
//     bool hasCloseIcon = false,
//     String? subText,
//     Widget? subWidget,
//     String? positiveText,
//     String? negativeText,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: SvgPicture.asset('assets/vectors/ic_error_on_dialog.svg'),
//       title: title,
//       subText: subText,
//       subWidget: subWidget,
//       hasCloseIcon: hasCloseIcon,
//       positiveText: positiveText ?? Strings.close.tr,
//       negativeText: negativeText,
//       onPositiveFunc: onPositiveFunc,
//       onNegativeFunc: onNegativeFunc,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(context ?? Get.context);
//   }

//   static void onDialogConfirmWithoutIcon(
//     BuildContext? context, {
//     required String title,
//     String? subText,
//     bool hasCloseIcon = false,
//     String? positiveText,
//     String? negativeText,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: null,
//       title: title,
//       subText: subText,
//       hasCloseIcon: hasCloseIcon,
//       positiveText: positiveText ?? Strings.close.tr,
//       negativeText: negativeText,
//       onPositiveFunc: onPositiveFunc,
//       onNegativeFunc: onNegativeFunc,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }

//   static void onDialogCancelWithoutIcon(
//     BuildContext? context, {
//     required String title,
//     String? subText,
//     bool hasCloseIcon = false,
//     String? positiveText,
//     String? negativeText,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: null,
//       title: title,
//       subText: subText,
//       hasCloseIcon: hasCloseIcon,
//       positiveText: positiveText ?? Strings.close.tr,
//       negativeText: negativeText,
//       onPositiveFunc: onPositiveFunc,
//       positiveButtonColor: AppColors.get().errorColor,
//       onNegativeFunc: onNegativeFunc,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }

//   static void onDialogSuccess(
//     BuildContext? context, {
//     required String title,
//     String? subText,
//     Widget? subWidget,
//     bool hasCloseIcon = false,
//     String? positiveText,
//     String? negativeText,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: SvgPicture.asset('assets/vectors/ic_success_on_dialog.svg'),
//       title: title,
//       subText: subText,
//       subWidget: subWidget,
//       hasCloseIcon: hasCloseIcon,
//       positiveText: positiveText ?? Strings.close.tr,
//       negativeText: negativeText,
//       onPositiveFunc: onPositiveFunc,
//       onNegativeFunc: onNegativeFunc,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }

//   static void onDialogConfirm(
//     BuildContext? context, {
//     required String title,
//     String? subText,
//     Widget? subWidget,
//     bool hasCloseIcon = false,
//     bool hasIcon = true,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     String? positiveText,
//     String? negativeText,
//     Color? positiveButtonColor,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: hasIcon
//           ? SvgPicture.asset('assets/vectors/ic_waring_on_dialog.svg')
//           : null,
//       title: title,
//       hasCloseIcon: hasCloseIcon,
//       subText: subText,
//       subWidget: subWidget,
//       negativeText: negativeText ?? Strings.close.tr,
//       positiveText: positiveText ?? Strings.confirm.tr,
//       onPositiveFunc: onPositiveFunc,
//       onNegativeFunc: onNegativeFunc,
//       positiveButtonColor: positiveButtonColor,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }

//   static void onDialogConfirmDelete(
//     BuildContext? context, {
//     required String title,
//     String? subText,
//     Widget? subWidget,
//     bool hasCloseIcon = false,
//     bool hasIcon = true,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     String? positiveText,
//     String? negativeText,
//     Color? positiveButtonColor,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: hasIcon
//           ? SvgPicture.asset('assets/vectors/ic_delete_on_dialog.svg')
//           : null,
//       title: title,
//       hasCloseIcon: hasCloseIcon,
//       subText: subText,
//       subWidget: subWidget,
//       negativeText: negativeText ?? Strings.close.tr,
//       positiveText: positiveText ?? Strings.confirm.tr,
//       onPositiveFunc: onPositiveFunc,
//       onNegativeFunc: onNegativeFunc,
//       positiveButtonColor: positiveButtonColor,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }

//   static Widget dialogFooter(
//     BuildContext context, {
//     required String positiveText,
//     required String negativeText,
//     Function? onPositiveFunc,
//     Function? onNegativeFunc,
//     bool isPositiveEnabled = true,
//   }) {
//     return Row(
//       children: [
//         Expanded(
//           child: AppOutlinedButtonWidget(
//             negativeText,
//             onPressed: () => onNegativeFunc?.call(),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: AppFilledButtonWidget(
//             positiveText,
//             isEnable: isPositiveEnabled,
//             onPressed: () => onPositiveFunc?.call(),
//           ),
//         ),
//       ],
//     );
//   }

//   static void onDialogDetailFailure({Function? onPositiveFunc}) {
//     DialogUtil.onDialogError(
//       Get.context,
//       title: Strings.getDataFailure.tr,
//       onPositiveFunc:
//           onPositiveFunc != null ? onPositiveFunc.call : () => Get.close(2),
//     );
//   }

//   static void onDialogWarning(
//     BuildContext? context, {
//     required String title,
//     required String subText,
//     bool hasCloseIcon = false,
//     bool hasIcon = true,
//     Function? onPositiveFunc,
//     String? positiveText,
//     Color? positiveButtonColor,
//     bool barrierDismissible = false,
//   }) {
//     AppDialogDefaultWidget(
//       icon: hasIcon
//           ? SvgPicture.asset('assets/vectors/ic_waring_on_dialog.svg')
//           : null,
//       title: title,
//       hasCloseIcon: hasCloseIcon,
//       subText: subText,
//       negativeText: null,
//       positiveText: positiveText ?? Strings.close.tr,
//       onPositiveFunc: onPositiveFunc,
//       positiveButtonColor: positiveButtonColor,
//       barrierDismissible: barrierDismissible,
//     ).showDialog(Get.context);
//   }
// }
