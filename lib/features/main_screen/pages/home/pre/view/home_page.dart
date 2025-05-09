import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/ads_card.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/hot_deal_row.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import '../../../../../../core/app_localization/app_localization.dart';
import '../../data/repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';
import 'widgets/text_part.dart';
import 'widgets/search_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return BlocProvider<UnitCubit>(
      create: (_) => UnitCubit(UnitRepository())..fetchHotDeals(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBarWidget(),
                const HomeTextPart(),
                const SearchCard(),
                HotDealRow(local: local),
                SizedBox(
                  height: 360.h,
                  child: BlocBuilder<UnitCubit, UnitState>(
                    builder: (context, state) {
                      if (state is UnitLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if (state is UnitLoaded) {
                        if (state.units.isEmpty) {
                          return const Center(child: Text('لا توجد بيانات لعرضها'));
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.units.length,
                          itemBuilder: (context, index) {
                            return AdsCard(unit: state.units[index]);
                          },
                        );
                      }
                      else if (state is UnitError) {
                        return Center(child: Text("خطأ: ${state.message}"));
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
                // get all ads button

              ],
            ),
          ),
        ),
      ),
    );
  }
}





