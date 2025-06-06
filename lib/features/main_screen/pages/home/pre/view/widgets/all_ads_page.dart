import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/global_card.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view/widgets/top_bar_widget.dart';
import '../../../../../../widgets/title_text.dart';
import '../../../data/repo/home_repo.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';
import '../unit_details.dart';

class AllAdsPage extends StatelessWidget {
  const AllAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    return BlocProvider<UnitCubit>(
      create: (_) => UnitCubit(UnitRepository())..fetchHotDeals(),
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(child: const TopBarWidget()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TitleText(title: loc.translate("Hot_deals")),
                ),
              ],
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
                                builder:
                                    (context) => UnitDetailsPage(
                                      unitId: state.units[index].id,
                                    ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GlobalCard(
                                imageUrl: state.units[index].imageUrl,
                                unitType: state.units[index].type.toString(),
                                price: state.units[index].price,
                                address: state.units[index].address.toString(),
                                numOfRooms: state.units[index].numOfRooms,
                                numOfBathrooms: state.units[index].numOfBathrooms,
                                unitArea: state.units[index].unitArea.toString(),
                                press: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UnitDetailsPage(unitId: state.units[index].id),
                                    ),
                                  );
                                },
                                unitId: state.units[index].id,
                                unit: state.units[index],
                            )

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
