// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../../core/constants/colors.dart';
// import '../../../../../../../core/constants/styles.dart';
// import '../../../../../../widgets/elevated_button_def.dart';
//
// class GlobalCard extends StatelessWidget {
//   final String images;
//   final String unitTap;
//   final String unitPrice;
//   final String unitAddress;
//   final String numOfRooms;
//   final String numOfBathrooms;
//   final String unitArea;
//   final VoidCallback onPressed;
//   final String buttonText;
//   final bool isFavorite;
//    const GlobalCard({
//     super.key,
//     required this.images,
//     required this.unitTap,
//     required this.unitPrice,
//     required this.unitAddress,
//     required this.numOfRooms,
//     required this.numOfBathrooms,
//     required this.unitArea,
//      required this.onPressed,
//      required this.buttonText,
//      required this.isFavorite,
//
//    });
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       width: screenWidth * 0.8,
//       child: Stack(
//         children: [
//           Card(
//             color: AppColors.backGround(context),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             elevation: 6,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                   child: Image.network(
//                     images,
//                     // widget.unit.images!.isNotEmpty
//                     //     ? widget.unit.images![0]
//                     //     : widget.unit.imageUrl,
//                     height: screenHeight * 0.18,
//                     width: screenWidth * 1.0,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     unitTap,
//                     style: AppTextStyles.title(
//                       context,
//                     ).copyWith(fontSize: 8.sp),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     "$unitPrice EGP",
//                     style: AppTextStyles.title(
//                       context,
//                     ).copyWith(fontSize: 17.sp),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_outlined,
//                         size: 16,
//                         color: AppColors.backGround(context),
//                       ),
//                       SizedBox(width: 4.w),
//                       Expanded(
//                         child: Text(
//                           unitAddress,
//                           overflow: TextOverflow.ellipsis,
//                           style: AppTextStyles.title(
//                             context,
//                           ).copyWith(fontSize: 8.sp),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8.0,
//                     vertical: 4,
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.king_bed_outlined,
//                         size: 20,
//                         color: AppColors.titleColor(context),
//                       ),
//                       SizedBox(width: 4.w),
//                       Text(
//                         numOfRooms,
//                         style: AppTextStyles.title(
//                           context,
//                         ).copyWith(fontSize: 12.sp),
//                       ),
//                       SizedBox(width: 15.w),
//                       Icon(
//                         Icons.bathtub_outlined,
//                         size: 16,
//                         color: AppColors.titleColor(context),
//                       ),
//                       SizedBox(width: 4.w),
//                       Text(
//                         numOfBathrooms,
//                         style: AppTextStyles.title(
//                           context,
//                         ).copyWith(fontSize: 12.sp),
//                       ),
//                       SizedBox(width: 15.w),
//                       Icon(
//                         Icons.maps_home_work_outlined,
//                         size: 16,
//                         color: AppColors.backGround(context),
//                       ),
//                       SizedBox(width: 4.w),
//                       Text(
//                         "$unitArea m²",
//                         style: AppTextStyles.title(
//                           context,
//                         ).copyWith(fontSize: 12.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButtonDef(press:onPressed, text:buttonText),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 8.h,
//             right: 8.w,
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(16),
//                 onTap: () {},
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.backGround(context),
//                     boxShadow: [
//                       BoxShadow(color: AppColors.black(context), blurRadius: 4),
//                     ],
//                   ),
//                   child: Icon(
//                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                     color: Colors.red,
//                     size: 24,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
