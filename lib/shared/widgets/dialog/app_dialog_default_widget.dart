// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:thannong/constants/app_constants.dart';

// import '../button/app_filled_button_widget.dart';
// import '../button/app_outlined_button_widget.dart';
// import '../text/app_text_widget.dart';

// class AppDialogDefaultWidget {
//   const AppDialogDefaultWidget({
//     required this.title,
//     required this.icon,
//     required this.positiveText,
//     this.hasCloseIcon = true,
//     this.negativeText,
//     this.subText,
//     this.subWidget,
//     this.onNegativeFunc,
//     this.onPositiveFunc,
//     this.barrierDismissible = false,
//     this.positiveButtonColor,
//     this.customActions,
//     this.isTitleInTop = false,
//   });

//   final Widget? icon;
//   final bool? hasCloseIcon, isTitleInTop;
//   final bool? barrierDismissible;
//   final String title;
//   final String? subText, negativeText;
//   final Widget? subWidget;
//   final String positiveText;
//   final Color? positiveButtonColor;
//   final Function? onNegativeFunc, onPositiveFunc;
//   final Widget? customActions;

//   void showDialog(BuildContext? context) {
//     if (Get.isDialogOpen == true || context == null) {
//       return;
//     }
//     Get.dialog(
//       Dialog(
//         insetPadding: const EdgeInsets.all(20),
//         child: Container(
//           decoration: BoxDecoration(
//             color: context.theme.dialogBackgroundColor,
//             borderRadius: BorderRadius.circular(24),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               hasCloseIcon == true
//                   ? Container(
//                       alignment: Alignment.centerRight,
//                       child: InkWell(
//                         onTap: () => Get.back(),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SvgPicture.asset(
//                             'assets/vectors/ic_close.svg',
//                             color: Colors.grey[900],
//                           ),
//                         ),
//                       ),
//                     )
//                   : Container(),
//               if (isTitleInTop == true)
//                 Text(
//                   title,
//                   style: context.textTheme.titleLarge,
//                   textAlign: TextAlign.center,
//                 ),
//               if (icon != null)
//                 Container(
//                   margin: EdgeInsets.only(
//                     top: hasCloseIcon == true && isTitleInTop == true
//                         ? 10
//                         : isTitleInTop == true
//                             ? 10
//                             : 40,
//                     bottom: 10,
//                   ),
//                   child: icon,
//                 ),
//               if (isTitleInTop == false)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     title,
//                     style: context.textTheme.titleLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               if (subText?.isNotEmpty == true)
//                 ConstrainedBox(
//                   constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
//                   child: Text(
//                     subText!,
//                     style: context.textTheme.bodyLarge,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               if (subWidget != null) subWidget!,
//               const SizedBox(height: 24),
//               customActions ??
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       if (negativeText?.isNotEmpty == true)
//                         Expanded(
//                           child: AppOutlinedButtonWidget(
//                             negativeText ?? '',
//                             onPressed: onNegativeFunc != null ? () => onNegativeFunc?.call() : () => Get.back(),
//                           ),
//                         ),
//                       if (negativeText?.isNotEmpty == true) const SizedBox(width: 8),
//                       Expanded(
//                         child: AppFilledButtonWidget(
//                           positiveText,
//                           fillColor: positiveButtonColor,
//                           onPressed: onPositiveFunc != null ? () => onPositiveFunc?.call() : () => Get.back(),
//                         ),
//                       )
//                     ],
//                   )
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: barrierDismissible ?? false,
//     );
//   }
// }
