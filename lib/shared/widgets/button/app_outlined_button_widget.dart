// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:thannong/app/config/theme/app_theme.dart';

// import '../text/app_text_widget.dart';

// class AppOutlinedButtonWidget extends StatelessWidget {
//   const AppOutlinedButtonWidget(this.text,
//       {this.isEnable = true,
//       this.onPressed,
//       this.textStyle,
//       this.prefixIcon,
//       this.borderColor,
//       Key? key})
//       : super(key: key);

//   final String text;
//   final bool isEnable;
//   final Widget? prefixIcon;
//   final TextStyle? textStyle;
//   final Color? borderColor;
//   final Function? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isEnable ? () => onPressed?.call() : null,
//       highlightColor: AppColors.get().successColor[5],
//       borderRadius: BorderRadius.circular(100),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: AppColors.get().neutralColor[0],
//           border: Border.all(
//             width: 1,
//             color: (isEnable ? borderColor : null) ??
//                 (isEnable
//                     ? AppColors.get().neutralColor[30]!
//                     : context.theme.disabledColor),
//           ),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (prefixIcon != null) prefixIcon!,
//             if (prefixIcon != null) const SizedBox(width: 12),
//             AppTextWidget(
//               text,
//               textStyle: (isEnable ? textStyle : null) ??
//                   context.textTheme.subtitle2?.copyWith(
//                     color: isEnable
//                         ? context.theme.primaryColor
//                         : AppColors.get().neutralColor[40]!,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
