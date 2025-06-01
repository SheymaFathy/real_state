// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/details_card_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/shared_preferences/cach_helper.dart';
import '../../../../../widgets/title_text.dart';
import '../../../my_fav/data/repo/favorite_repo.dart';
import '../../../my_fav/pre/view_model/my_favorite_cubit.dart';
import '../../../my_fav/pre/view_model/my_favorite_state.dart';
import '../../data/repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class UnitDetailsPage extends StatefulWidget {
  final int unitId;

  const UnitDetailsPage({super.key, required this.unitId});

  @override
  UnitDetailsPageState createState() => UnitDetailsPageState();
}

class UnitDetailsPageState extends State<UnitDetailsPage> {
  List<String> comments = [];
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return WillPopScope(
      onWillPop: () async {
        context.push(AppRoutes.mainScreen);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              const TopBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) =>
                            UnitCubit(UnitRepository())..fetchUnitDetails(widget.unitId),
                          ),
                          BlocProvider(
                            create: (_) => FavoriteCubit( FavoriteRepository()..getFavorites()),
                          ),
                        ],
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

                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AdsDetailsCard(unit: unit),
                                  ),
                                  Positioned(
                                    top: 16,
                                    right: 16,
                                    child: BlocConsumer<FavoriteCubit, FavoriteState>(
                                      listener: (context, favState) {
                                        if (favState is FavoriteSuccess) {
                                          setState(() {
                                            unit.isFavorite = !unit.isFavorite;
                                          });
                                        }
                                      },
                                      builder: (context, favState) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(16),
                                            onTap: () {
                                              final token = CacheHelper.getSaveData(key: "token");
                                              if (token != null && token.isNotEmpty) {
                                                context
                                                    .read<FavoriteCubit>()
                                                    .addToFavorite(unit.id.toString());
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) => AlertDialog(
                                                      backgroundColor: AppColors.backGround(context),
                                                      title: TitleText(title: loc.translate("alert")),
                                                      content: TitleText(title: loc.translate("to_add_favorite"),),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () => Navigator.pop(context),
                                                          child: TitleText(title: loc.translate("cancel")),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: AppColors.primary(context),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            context.go(AppRoutes.login);
                                                          },
                                                          child: TitleText(title: loc.translate("login"),),
                                                        ),
                                                      ],
                                                    )
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                              ),
                                              child: Icon(
                                                unit.isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: unit.isFavorite ? Colors.red : Colors.grey,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
