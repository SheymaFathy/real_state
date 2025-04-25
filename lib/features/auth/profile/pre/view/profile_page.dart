import 'package:flutter/material.dart';
import 'package:real_state/core/constants/colors.dart';
import 'package:real_state/features/auth/profile/pre/view/widget/profile_view.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("My Profile"),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  // Handle edit action
                },
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,


      ),
      body: ListView(
        children: const [
          ProfileView(),

        ],
      ),
    );
  }
}
















