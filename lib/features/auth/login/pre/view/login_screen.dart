import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/constants/app_images.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions..dart';
import 'package:real_state/core/helper/validator_def.dart';
import 'package:real_state/core/theme/theme_cubit.dart';
import 'package:real_state/features/auth/login/data/model/login_user_model.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import 'package:real_state/features/auth/register/pre/view/register.dart';
import 'package:real_state/widgets/custom_text_field.dart';
import 'package:real_state/widgets/elevated_button_def.dart';
import '../../../../main_screen/pages/home/pre/view/home_page.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final loc = context.loc;
    final isDark = context.read<ThemeCubit>().state.themeMode == ThemeMode.dark;


    return BlocProvider(
      create: (context) => LoginCubit(LoginRepository()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          } else if (state is LoginFailure) {
            print(state.message);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
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
                          children: [
                            Text(
                              loc.translate("login"),
                              style: AppFonts.body(locale, isDark: isDark),
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: loginCubit.emailController,
                              label: loc.translate("email"),
                              icon: Icons.email_outlined,
                              paddingTop: 10,
                              validator: ValidatorDef.validatorEmail,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: loginCubit.passwordController,
                              label: loc.translate("password"),
                              icon: Icons.lock_outline,
                              paddingTop: 10,
                              validator: ValidatorDef.validatorPassword,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forget Password?",
                                    style: AppFonts.body(
                                      locale,
                                      isDark: isDark,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /// BlocConsumer for login handling
                            ElevatedButtonDef(
                              press: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginCubit>(context).loginUser(
                                    LoginUserModel(
                                      email: loginCubit.emailController.text.trim(),
                                      password: loginCubit.passwordController.text,
                                    ),
                                  );
                                }
                              },
                              text: state is LoginLoading ? 'Loading...' : 'Login',
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Do not have an account?",
                                  style: AppFonts.body(
                                    Localizations.localeOf(context),
                                    isDark: isDark,
                                  ).copyWith(fontSize: 13),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Register(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Create it now",
                                    style: AppFonts.body(
                                      locale,
                                      isDark: isDark,
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

// Moved LogoClipper to the top level
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
