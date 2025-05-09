import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/profile/pre/view/profile_page.dart';
import '../../pages/home/pre/view/home_page.dart';
import '../../pages/my_fav/pre/view/my_favorite.dart';
import '../view_model/navigation_cubit.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pages = const [

    MyFavorite(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state],
            bottomNavigationBar: CustomBottomNavBar(
                currentIndex: state),
          );
        },
      ),
    );
  }
}
