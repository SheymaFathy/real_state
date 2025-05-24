import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view/search_result.dart';
import 'package:real_state/features/main_screen/pages/search/pre/view_model/search_cubit.dart';
import 'package:real_state/features/widgets/elevated_button_def.dart';
import 'package:real_state/features/widgets/title_text.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../widgets/custom_text_field.dart';
import '../../../data/model/search_set_model.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.searchCubit,
    this.isHome = false,
  });

  final SearchCubit searchCubit;
  final bool isHome;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final TextEditingController minPrice = TextEditingController();

  final TextEditingController maxPrice = TextEditingController();

  final TextEditingController numOfBedroom = TextEditingController();

  final TextEditingController numOfBathroom = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.searchCubit,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: AppColors.backGround(context),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TitleText(title: "فلترة العقارات"),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'اقل سعر',
                      controller: minPrice,
                      paddingTop: 10,
                      isPassword: false,
                      icon: Icons.money,
                    ),
                    CustomTextField(
                      label: 'اعلى سعر',
                      controller: maxPrice,
                      paddingTop: 10,
                      isPassword: false,
                      icon: Icons.monetization_on_rounded,
                    ),
                    CustomTextField(
                      label: 'عدد الغرف',
                      controller: numOfBedroom,
                      paddingTop: 10,
                      isPassword: false,
                      icon: Icons.bed,
                    ),
                    CustomTextField(
                      label: 'عدد الحمامات',
                      controller: numOfBathroom,
                      paddingTop: 10,
                      isPassword: false,
                      icon: Icons.bathtub_outlined,
                    ),
                    const SizedBox(height: 20),

                    ElevatedButtonDef(
                      press: () {
                        int? min = int.tryParse(minPrice.text);
                        int? max = int.tryParse(maxPrice.text);
                        int? bedrooms = int.tryParse(numOfBedroom.text);
                        int? bathrooms = int.tryParse(numOfBathroom.text);

                        final SearchSetModel searchSetModel = SearchSetModel(
                          location: "",
                          page: 1,
                          pageSize: 10,
                          userType: 0,
                          unitType: 0,
                          minPrice: min,
                          maxPrice: max,
                          numOfBathrooms: bathrooms,
                          numOfRooms: bedrooms,
                          hotDeals: 0,
                        );
                        if (widget.isHome == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => SearchResult(
                                    searchSetModel: searchSetModel,
                                  ),
                            ),
                          );
                        } else {
                          context.read<SearchCubit>().getData(searchSetModel);
                          Navigator.of(context).pop();
                        }
                      },
                      text: 'بحث',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
