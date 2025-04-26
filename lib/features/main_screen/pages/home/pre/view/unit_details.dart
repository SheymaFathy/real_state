import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/details_card_widget.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import '../../data/repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class UnitDetailsPage extends StatelessWidget {
  final int unitId;

  const UnitDetailsPage({super.key, required this.unitId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(  child: const TopBarWidget(),),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Expanded(
              child: BlocProvider(
                create: (_) => UnitCubit(UnitRepository())..fetchUnitDetails(unitId),
                child: BlocBuilder<UnitCubit, UnitState>(
                  builder: (context, state) {
                    if (state is UnitLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UnitLoaded) {
                      if (state.units.isEmpty) {
                        return const Center(child: Text("لا توجد بيانات"));
                      }

                      var unit = state.units.first;
                      return  AdsDetailsCard(unit: unit);
                    } else if (state is UnitError) {
                      return Center(child: Text("خطأ: ${state.message}"));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

