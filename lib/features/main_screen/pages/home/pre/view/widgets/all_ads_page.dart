import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import '../../../data/repo/home_repo.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';
import '../unit_details.dart';
import 'ads_card.dart';

class AllAdsPage extends StatelessWidget {
  const AllAdsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<UnitCubit>(
      create: (_) => UnitCubit(UnitRepository())..fetchUnits(),
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: const TopBarWidget(),
            ),
            Expanded(
              child: BlocBuilder<UnitCubit, UnitState>(
                builder: (context, state) {
                  if (state is UnitLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UnitLoaded) {
                    return ListView.builder(
                      itemCount: state.units.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UnitDetailsPage(unitId: state.units[index].id),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AdsCard(unit: state.units[index]),
                          ),
                        );
                      },
                    );
                  } else if (state is UnitError) {
                    return Center(child: Text("خطأ: ${state.message}"));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
