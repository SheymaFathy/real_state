import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main_screen/pages/search/data/model/search_model.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view/widgets/sort_btm_sheet.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view_model/search_cubit.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../data/model/search_set_model.dart';
import 'filter_btm_sheet.dart';

class SearchTopRow extends StatelessWidget {
  const SearchTopRow({super.key, required this.locationController,this.list});

  final TextEditingController locationController;
 final List<Data>? list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.backGround(context),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 45.h,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    hintText: "New Location",
                    border: InputBorder.none,
                    hintStyle: AppTextStyles.body(
                      context,
                    ).copyWith(color: AppColors.textHintColor(context)),
                  ),
                  onSubmitted: (value) {
                    final SearchSetModel searchSetModel = SearchSetModel(
                      location: locationController.text,
                    );
                    context.read<SearchCubit>().getData(searchSetModel);
                    // Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(width: 8.w),
            //  sort
            Container(
              height: 45.h,
              width: 45.h,
              decoration: BoxDecoration(
                color: AppColors.textFieldColor(context),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.swap_vert, color: AppColors.primary(context)),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder:
                        (_) => SortBottomSheet(
                      searchCubit: context.read<SearchCubit>(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 8.w),
            // زر filter
            Container(
              height: 45.h,
              width: 45.h,
              decoration: BoxDecoration(
                color: AppColors.textFieldColor(context),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: AppColors.primary(context),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder:
                        (_) => FilterBottomSheet(
                          searchCubit: context.read<SearchCubit>(),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
