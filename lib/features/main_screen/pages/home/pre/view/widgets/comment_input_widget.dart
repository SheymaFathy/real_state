// import 'package:flutter/material.dart';
// import 'package:real_state/core/constants/colors.dart';
// import '../../../../../../widgets/custom_text_field.dart';
//
// class CommentInputWidget extends StatelessWidget {
//   final TextEditingController controller;
//   final VoidCallback onSend;
//
//   const CommentInputWidget(BuildContext context, {
//     super.key,
//     required this.controller,
//     required this.onSend,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: CustomTextField(
//             label: 'Add Comment',
//             controller: controller,
//             paddingTop: 10,
//             isPassword: false,
//             icon: Icons.comment,
//           ),
//         ),
//         const SizedBox(width: 8),
//         IconButton(
//           onPressed: onSend,
//           icon:  Icon(
//             Icons.send,
//             color: AppColors.primary(context),
//           ),
//         ),
//       ],
//     );
//   }
// }
