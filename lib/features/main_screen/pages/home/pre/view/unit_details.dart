import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/comment_input_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/comments_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/details_card_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/title_text.dart';
import '../../data/repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class UnitDetailsPage extends StatefulWidget {
  final int unitId;

  const UnitDetailsPage({super.key, required this.unitId});

  @override
  _UnitDetailsPageState createState() => _UnitDetailsPageState();
}

class _UnitDetailsPageState extends State<UnitDetailsPage> {
  List<String> comments = [];
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return WillPopScope(
      onWillPop: () async {
        context.go(AppRoutes.mainScreen);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              const TopBarWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(title: loc.translate("units_details")),
                    IconButton(
                      onPressed: () => context.go(AppRoutes.mainScreen),
                      icon: Icon(Icons.arrow_back, color: AppColors.titleColor(context)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocProvider(
                        create: (_) => UnitCubit(UnitRepository())..fetchUnitDetails(widget.unitId),
                        child: BlocBuilder<UnitCubit, UnitState>(
                          builder: (context, state) {
                            if (state is UnitLoading) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (state is UnitLoaded) {
                              if (state.units.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(loc.translate("no_data")),
                                );
                              }

                              var unit = state.units.first;

                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: AdsDetailsCard(unit: unit),
                              );
                            } else if (state is UnitError) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("خطأ: ${state.message}"),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                      const Divider(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          loc.translate("comments"),
                          style: AppTextStyles.title(context),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CommentsWidget(comments: comments),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CommentInputWidget(context, controller: commentController, onSend: () {
              String comment = commentController.text.trim();
              if (comment.isNotEmpty) {
                setState(() {
                  comments.add(comment);
                });
                commentController.clear();
              }
            },),
          ),
        ),
      ),
    );
  }
}
