// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/search/data/model/search_model.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view/widgets/seach_result_card.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view/widgets/search_top_row.dart';
import '../../../home/pre/view/widgets/top_bar_widget.dart';
import '../../data/model/search_set_model.dart';
import '../view_model/search_cubit.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key, required this.searchSetModel});

  final SearchSetModel searchSetModel;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().getData(widget.searchSetModel);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          List<Data>? list = context.read<SearchCubit>().searchModel?.data;

          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            return list == null
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                  child: Column(
                    children: [
                      TopBarWidget(),
                      SearchTopRow(
                        locationController: locationController,
                        list: list,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16,
                              ),
                              child: SearchResultCard(data: list[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
