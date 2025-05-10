import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_images.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/helper/validator_def.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import 'package:real_state/features/widgets/custom_text_field.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/helper/routes.dart';
import '../../../../widgets/elevated_button_def.dart';
import '../../../../widgets/title_text.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_state.dart';

class LoginScreen extends StatelessWidget {
  final String? email;
  final String? password;

  LoginScreen({super.key, this.email, this.password});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return BlocProvider(
      create: (context) {
        final loginCubit = LoginCubit(LoginRepository());

        if (email != null) loginCubit.emailController.text = email!;
        if (password != null) loginCubit.passwordController.text = password!;

        return loginCubit;
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go(AppRoutes.mainScreen);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  // Background
                  Container(
                    width: double.infinity,
                    height: 218,
                    color: AppColors.primary(context),
                  ),

                  // Top Info Box
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.backGround(context),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppImages.topBarImg, width: 116, height: 77),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loc.translate("login"),
                                style: AppTextStyles.body(context).copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              TitleText(
                                title: loc.translate("Welcome_back"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Login Form
                  Padding(
                    padding: const EdgeInsets.only(top: 250, left: 16, right: 16),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                    loc.translate("forgot_password"),
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
                                  ? loc.translate("loading")
                                  : loc.translate("login"),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  loc.translate("Don't have an account?"),
                                  style: AppTextStyles.body(context)
                                      .copyWith(fontSize: 13),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.go(AppRoutes.register);
                                  },
                                  child: Text(
                                    loc.translate("Create it now"),
                                    style: AppTextStyles.body(context)
                                        .copyWith(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
