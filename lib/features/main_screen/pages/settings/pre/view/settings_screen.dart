// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:real_state/core/app_localization/app_localization.dart';
// import 'package:real_state/core/app_localization/language_cubit.dart';
// import 'package:real_state/core/theme/theme_cubit.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final langCubit = context.read<LanguageCubit>();
//     final themeCubit = context.read<ThemeCubit>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context).translate("settings")),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // تغيير اللغة
//             ListTile(
//               leading: const Icon(Icons.language),
//               title: Text(AppLocalizations.of(context).translate('change_language')),
//               trailing: DropdownButton<String>(
//                 value: langCubit.state.locale.languageCode,
//                 onChanged: (value) {
//                   if (value != null) {
//                     langCubit.changeLanguage(value);
//                   }
//                 },
//                 items: const [
//                   DropdownMenuItem(value: 'en', child: Text('English')),
//                   DropdownMenuItem(value: 'ar', child: Text('العربية')),
//                 ],
//               ),
//             ),

//             // الوضع الداكن
//             // BlocBuilder<ThemeCubit, ThemeMode>(
//             //   builder: (context, themeMode) {
//             //     return SwitchListTile(
//             //       secondary: const Icon(Icons.dark_mode),
//             //       title: Text(AppLocalizations.of(context).translate('dark_mode')),
//             //       value: themeMode == ThemeMode.dark,
//             //       onChanged: (value) => themeCubit.toggleTheme(value),
//             //     );
//             //   },
//             // ),

//             ListTile(
//               leading: const Icon(Icons.info),
//               title: Text(AppLocalizations.of(context).translate('about_app')),
//               onTap: () {
//                 showAboutDialog(
//                   context: context,
//                   applicationName: 'Real Estate App',
//                   applicationVersion: '1.0.0',
//                   applicationLegalese: '© 2025 جميع الحقوق محفوظة',
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
