import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/constants/colors.dart';
import 'package:real_state/features/main_screen/pages/search/data/model/search_model.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view_model/search_cubit.dart';
import 'package:real_state/features/widgets/elevated_button_def.dart';
import 'package:real_state/features/widgets/title_text.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key,this.list, required this.searchCubit});
  final List<Data>? list;
  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.backGround(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
           return  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText(title: "ترتيب حسب السعر"),
                          const SizedBox(height: 16),
                          ElevatedButtonDef(
                            press: () {
                             context.read<SearchCubit>().sortData(false);
                              Navigator.pop(context);
                            },
                            text: "من الأعلى للأقل",
                          ),
                          const SizedBox(height: 8),
                          ElevatedButtonDef(
                            press: () {
                              context.read<SearchCubit>().sortData(true);
                              Navigator.pop(context);
                            },
                            text: "من الأقل للأعلى",
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }

}
