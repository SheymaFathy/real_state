// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:real_state/core/helper/routes.dart';
// import 'package:real_state/features/auth/register/pre/view_model/register_cubit.dart';
// import 'package:real_state/features/auth/register/pre/view_model/register_state.dart';
// import 'package:real_state/features/widgets/custom_text_field.dart';
// import 'package:real_state/core/constants/app_images.dart';
// import 'package:real_state/core/constants/colors.dart';
// import '../../../../../core/helper/validator_def.dart';
// import '../../../../widgets/elevated_button_def.dart';
// import '../../data/model/register_user_model.dart';
// import '../../data/repo/register_repo.dart';
// import '../../../login/pre/view/login_screen.dart';
//
// class Register extends StatelessWidget {
//   Register({super.key});
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterCubit(RegisterRepository()),
//       child: BlocConsumer<RegisterCubit, RegisterState>(
//         listener: (context, state) {
//           if (state is RegisterSuccess) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.message),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//               context.go(
//                 AppRoutes.login,
//                 extra: {
//                   'email': context.read<RegisterCubit>().emailController.text,
//                   'password': context.read<RegisterCubit>().passwordController.text,
//                 },
//               );
//             });
//           } else if (state is RegisterFailure) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.error), backgroundColor: Colors.red),
//               );
//             });
//           }
//         },
//
//         builder: (context, state) {
//           final registerCubit = context.read<RegisterCubit>();
//           return Scaffold(
//             body: Column(
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.4,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF4199C3), Colors.white],
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(100),
//                     ),
//                   ),
//                   child: Center(
//                     child: Image.asset(AppImages.splash, height: 300),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 20,
//                     ),
//                     child: SingleChildScrollView(
//                       child: Form(
//                         key: formKey,
//                         child: Column(
//                           children: [
//                             Text(
//                               "Register",
//                               style: TextStyle(
//                                 color: AppColors.titleColor(context),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 30,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             CustomTextField(
//                               controller: registerCubit.nameController,
//                               label: "User Name",
//                               icon: Icons.person_outline,
//                               validator: ValidatorDef.validatorname,
//                               paddingTop: 15, isPassword: false,
//                             ),
//                             CustomTextField(
//                               controller: registerCubit.emailController,
//                               label: "Email",
//                               icon: Icons.email_outlined,
//                               validator: ValidatorDef.validatorEmail,
//                               paddingTop: 15, isPassword: false,
//                             ),
//                             CustomTextField(
//                               controller: registerCubit.phoneController,
//                               label: "Phone Number",
//                               icon: Icons.phone,
//                               validator: ValidatorDef.validatorPhone,
//                               paddingTop: 15, isPassword: false,
//                             ),
//                             CustomTextField(
//                               controller: registerCubit.passwordController,
//                               label: "Password",
//                               icon: Icons.lock_outline,
//                               validator: ValidatorDef.validatorPassword,
//                               paddingTop: 15, isPassword: false,
//                             ),
//                             CustomTextField(
//                               controller: registerCubit.confirmPasswordController,
//                               label: "Confirm Password",
//                               icon: Icons.lock_outline,
//                               validator: ValidatorDef.validatorPassword,
//                               paddingTop: 15, isPassword: false,
//                             ),
//                             const SizedBox(height: 10),
//                             BlocBuilder<RegisterCubit, RegisterState>(
//                               builder: (context, state) {
//                                 if (state is RegisterLoading) {
//                                   return const CircularProgressIndicator();
//                                 }
//                                 return ElevatedButtonDef(
//                                   text: "Register",
//                                   press: () async {
//                                     if (formKey.currentState!.validate()) {
//                                       RegisterUserModel user = RegisterUserModel(
//                                         username: registerCubit.nameController.text,
//                                         email: registerCubit.emailController.text,
//                                         password: registerCubit.passwordController.text,
//                                         phoneNumber: registerCubit.phoneController.text,
//                                         firstName: "First Name",
//                                         lastName: "Last Name",
//                                         address: "Cairo",
//                                         userType: 2,
//                                       );
//                                       await context.read<RegisterCubit>().register(user);
//                                     }
//                                   },
//                                 );
//                               },
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "I have account already?",
//                                   style: TextStyle(color: Color(0xFF15364a)),
//                                 ),
//                                 TextButton(
//                                   onPressed: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => LoginScreen(),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     "Sign IN",
//                                     style: TextStyle(color: Color(0xFF4199C3)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }