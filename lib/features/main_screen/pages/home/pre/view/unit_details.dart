// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/details_card_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';

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
                      BlocProvider(
                        create:
                            (_) =>
                                UnitCubit(UnitRepository())
                                  ..fetchUnitDetails(widget.unitId),
                        child: BlocBuilder<UnitCubit, UnitState>(
                          builder: (context, state) {
                            if (state is UnitLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is UnitLoaded) {
                              if (state.units.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(loc.translate("no_data")),
                                );
                              }

                              var unit = state.units.first;

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
