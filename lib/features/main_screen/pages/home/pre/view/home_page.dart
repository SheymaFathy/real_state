import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main_screen/pages/home/data/repo/home_repo.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/ads_card.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import 'package:real_state/widgets/title_text.dart';
import '../../../../../../core/app_localization/app_localization.dart';

import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';
import 'widgets/text_part.dart';
import 'widgets/search_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarWidget(),
              const HomeTextPart(),
              const SearchCard(),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 16,
                ),
                child: TitleText(title: local.translate('Hot_deals')),
              ),
              SizedBox(
                height: 360.h,
                child: BlocProvider(
                  create: (context) => UnitCubit(HomeRepository())..getUnits(),
                  child: BlocBuilder<UnitCubit, UnitState>(
                    builder: (context, state) {
                      if (state is UnitLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UnitLoaded) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.units.length,
                          itemBuilder: (context, index) {
                            return AdsCard(unit: state.units[index]);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
