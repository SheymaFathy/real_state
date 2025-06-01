import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/helper/context_extensions.dart';

import '../../../../../../../core/constants/colors.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../../../widgets/title_text.dart';
import '../../../data/model/search_model.dart';
import '../../../data/model/search_set_model.dart';
import '../../view_model/search_cubit.dart';
import '../search_result.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({
    super.key,
    this.list,
    required this.searchCubit,
    required this.searchSetModel,
    this.isHome = false,
  });

  final List<Data>? list;
  final SearchCubit searchCubit;
  final SearchSetModel searchSetModel;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final loc = context.loc;
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
          return Column(
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
                       TitleText(title: loc.translate("sort_by_price")),
                      const SizedBox(height: 16),

                      ElevatedButtonDef(
                        press: () async {
                          await context.read<SearchCubit>().getData(searchSetModel);
                          context.read<SearchCubit>().sortData(isAscending: false);
                          Navigator.pop(context);

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchResult(
                                  searchSetModel: searchSetModel,
                                ),
                              ),
                            );
                          });
                        },
                        text: loc.translate("max_to_min_price"),
                      ) ,

                      const SizedBox(height: 8),
                      ElevatedButtonDef(
                        press: () async {
                          await context.read<SearchCubit>().getData(searchSetModel);
                          context.read<SearchCubit>().sortData(isAscending: true);
                          Navigator.pop(context);

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchResult(
                                  searchSetModel: searchSetModel,
                                ),
                              ),
                            );
                          });
                        },
                        text: loc.translate("min_to_max_price"),
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
