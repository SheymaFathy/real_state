import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/routes.dart';
import '../../../../../core/helper/validator_def.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../login/pre/view/login_screen.dart';
import '../../data/model/register_user_model.dart';
import '../../data/repo/register_repo.dart';
import '../view_model/register_cubit.dart';
import '../view_model/register_state.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepository()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
              context.go(
                AppRoutes.login,
                extra: {
                  'email': context.read<RegisterCubit>().emailController.text,
                  'password': context.read<RegisterCubit>().passwordController.text,
                },
              );
            });
          } else if (state is RegisterFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error), backgroundColor: Colors.red),
              );
            });
          }
        },
        builder: (context, state) {
          final loc = context.loc;
          final width = MediaQuery
              .of(context)
              .size
              .width;
          final height = MediaQuery
              .of(context)
              .size
              .height;
          final registerCubit = context.read<RegisterCubit>();
          return Scaffold(

            body: SafeArea(
              child: Stack(
                children: [
                  // Background color
                  Container(
                    width: width,
                    height: height,
                    color: AppColors.primary(context),
                  ),

                  // Foreground container with form
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: width,
                      margin: const EdgeInsets.only(top: 0),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.topBarImg, height: 77,
                                      width: 116),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(loc.translate("register"),
                                          style: AppTextStyles.headline(
                                              context)),
                                      const SizedBox(height: 5),
                                      Text(loc.translate("create_account"),
                                        style: AppTextStyles.body(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                controller: registerCubit.nameController,
                                label: loc.translate("user_name"),
                                icon: Icons.person_outline,
                                validator: ValidatorDef.validatorname,
                                paddingTop: 10,
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: registerCubit.emailController,
                                label: loc.translate("email"),
                                icon: Icons.email_outlined,
                                validator: ValidatorDef.validatorEmail,
                                paddingTop: 10,
                                isPassword: false,
                              ),
                              CustomTextField(
                                keyboard: TextInputType.phone,
                                controller: registerCubit.phoneController,
                                label: loc.translate("phone_number"),
                                icon: Icons.phone,
                                validator: ValidatorDef.validatorPhone,
                                paddingTop: 10,
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: registerCubit.passwordController,
                                label: loc.translate("password"),
                                icon: Icons.lock_outline,
                                validator: ValidatorDef.validatorPassword,
                                paddingTop: 10,
                                isPassword: true,
                              ),
                              CustomTextField(
                                controller: registerCubit
                                    .confirmPasswordController,
                                label: loc.translate("confirm_password"),
                                icon: Icons.lock_outline,
                                validator: ValidatorDef.validatorPassword,
                                paddingTop: 10,
                                isPassword: true,
                              ),
                                const SizedBox(height: 10),
                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) {
                                  if (state is RegisterLoading) {
                                    return const CircularProgressIndicator();
                                  }
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      icon: Icon(Icons.login,
                                          color: AppColors.btnText(context)),
                                      label: Text(loc.translate("register"),
                                        style: AppTextStyles.btnText(context),

                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary(
                                            context),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          RegisterUserModel user = RegisterUserModel(
                                            username: registerCubit
                                                .nameController.text,
                                            email: registerCubit.emailController
                                                .text,
                                            password: registerCubit
                                                .passwordController.text,
                                            phoneNumber: registerCubit
                                                .phoneController.text,
                                            firstName: "First Name",
                                            lastName: "Last Name",
                                            address: "Cairo",
                                            userType: 2,
                                          );
                                          await context
                                              .read<RegisterCubit>()
                                              .register(user);
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      loc.translate("have_an_account_already"),
                                  style: AppTextStyles.body(context)),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => LoginScreen()),
                                      );
                                    },
                                    child: Text(loc.translate("login"),
                                        style: AppTextStyles.body(context)
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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