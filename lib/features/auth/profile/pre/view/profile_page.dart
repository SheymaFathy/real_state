import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/constants/colors.dart';
import 'package:real_state/features/auth/profile/pre/view/widget/profile_view.dart';
import '../../../../../core/theme/theme_cubit.dart';
import '../../../../../core/theme/theme_status.dart';
import '../../../logout_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogoutCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.primary(context),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My Profile"),
                    BlocBuilder<LogoutCubit, LogoutState>(
                      builder: (context, state) {
                        if (state is LogoutLoading) {
                          return const CircularProgressIndicator(color: Colors.white);
                        }
                        return IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            context.read<LogoutCubit>().logoutUser(context);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                ProfileView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

