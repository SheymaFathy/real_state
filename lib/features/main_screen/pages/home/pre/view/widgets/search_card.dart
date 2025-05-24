// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/styles.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view/search_result.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view_model/search_cubit.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../search/data/model/search_model.dart';
import '../../../../search/data/model/search_set_model.dart';
import '../../../../search/pre/view/widgets/filter_btm_sheet.dart';
import '../../../../search/pre/view/widgets/sort_btm_sheet.dart';
import '../../../data/model/unit_model.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key, this.list});
  final List<Data>? list;

  @override
  // ignore: library_private_types_in_public_api
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  String selectedFilter = "Select Filter";
  String selectCustomTextFieldSort = "Select Sort";
  TextEditingController locationController = TextEditingController();

  List<UnitModel> searchResults = [];

  Future<void> searchUnits() async {
    try {
      setState(() {});
    } catch (e) {
      print("Error fetching units: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    return Container(
      width: 344.w,
      height: 260.h,
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      decoration: BoxDecoration(
        color: AppColors.backGround(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.backGround(context), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(loc.translate("Location"), style: AppTextStyles.body(context)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          TextField(
            style: TextStyle(color: AppColors.titleColor(context)),
            controller: locationController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              hintText: loc.translate("Dokki_Giza"),
              fillColor: AppColors.textFieldColor(context),
              filled: true,
              hintStyle: AppTextStyles.body(
                context,
              ).copyWith(color: AppColors.textHintColor(context)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Divider(),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Sort Button
              Container(
                width: 116.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.backGround(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder:
                          (_) => SortBottomSheet(
                        searchCubit: context.read<SearchCubit>(), searchSetModel: SearchSetModel(
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swap_vert, color: AppColors.primary(context)),
                      const SizedBox(width: 8),
                      Text(
                        loc.translate("sort"),
                        style: AppTextStyles.body(context).copyWith(
                          color: AppColors.titleColor(context),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.h,
                width: 1,
                color: AppColors.titleColor(context),
              ),
              // Filter Button
              Container(
                width: 116.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.backGround(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border(
                    right: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.backGround(context),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder:
                          (_) => FilterBottomSheet(
                            searchCubit: context.read<SearchCubit>(),
                            isHome: true,
                          ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sort, color: AppColors.primary(context)),
                      const SizedBox(width: 8),
                      Text(
                        loc.translate("filter"),
                        style: AppTextStyles.body(context).copyWith(
                          color: AppColors.titleColor(context),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Divider(),
          SizedBox(height: 5.h),
          ElevatedButtonDef(
            press: () async {
              SearchSetModel searchSetModel = SearchSetModel(
                location: locationController.text,
                page: 1,
                pageSize: 10,
                userType: 0,
                unitType: 0,
                minPrice: 0,
                maxPrice: 0,
                numOfBathrooms: 0,
                numOfRooms: 0,
                hotDeals: 0,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SearchResult(searchSetModel: searchSetModel),
                ),
              );
            },
            text: loc.translate("search"),
          ),

          if (searchResults.isNotEmpty)
            ...searchResults.map((unit) => Text(unit.title)),
        ],
      ),
    );
  }
}
