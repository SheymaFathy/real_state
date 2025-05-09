import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_images.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/helper/validator_def.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import 'package:real_state/features/widgets/custom_text_field.dart';
import '../../../../../core/helper/routes.dart';
import '../../../../widgets/elevated_button_def.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_state.dart';

class LoginScreen extends StatelessWidget {
  final String? email;
  final String? password;

  // Constructor to pass email and password
  LoginScreen({super.key, this.email, this.password});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return BlocProvider(
      create: (context) {
        final loginCubit = LoginCubit(LoginRepository());

        // Set the email and password if provided
        if (email != null) loginCubit.emailController.text = email!;
        if (password != null) loginCubit.passwordController.text = password!;

        return loginCubit;
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            if (context.mounted) {
              context.go(AppRoutes.mainScreen);
            }
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: Column(
              children: [
                ClipPath(
                  clipper: LogoClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4199C3), Colors.white],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(AppImages.splash, height: 300),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loc.translate("login"),
                              style: AppTextStyles.body(context),
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: loginCubit.emailController,
                              label: loc.translate("email"),
                              icon: Icons.email_outlined,
                              paddingTop: 10,
                              validator: ValidatorDef.validatorEmail,
                              isPassword: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: loginCubit.passwordController,
                              label: loc.translate("password"),
                              icon: Icons.lock_outline,
                              paddingTop: 10,
                              validator: ValidatorDef.validatorPassword,
                              isPassword: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forget Password?",
                                    style: AppTextStyles.body(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ElevatedButtonDef(
                              press: () {
                                if (formKey.currentState!.validate()) {
                                  loginCubit.loginUser(context);
                                }
                              },
                              text: state is LoginLoading
                                  ? 'Loading...'
                                  : 'Login',
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: AppTextStyles.body(
                                    context,
                                  ).copyWith(fontSize: 13),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.go(AppRoutes.register);
                                  },
                                  child: Text(
                                    "Create it now",
                                    style: AppTextStyles.body(
                                      context,
                                    ).copyWith(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LogoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(60, size.height, 150, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}