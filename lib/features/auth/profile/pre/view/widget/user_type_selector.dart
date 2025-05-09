// import 'package:flutter/material.dart';
// import 'package:real_state/features/auth/profile/pre/view/widget/type_chip.dart';
//
// class UserTypeSelector extends StatelessWidget {
//   const UserTypeSelector({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Icon(Icons.person_outline, color: Colors.grey.shade700),
//           const SizedBox(width: 8),
//           const Text("User Type", style: TextStyle(fontWeight: FontWeight.bold)),
//         ]),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             TypeChip(label: "Company", selected: true),
//              const SizedBox(width: 12),
//             TypeChip(label: "Individual", selected: false),
//           ],
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }