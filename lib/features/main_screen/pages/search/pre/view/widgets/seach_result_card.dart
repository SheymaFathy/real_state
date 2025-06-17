import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/search/data/model/search_model.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../../core/helper/routes.dart';
import '../../../../../../../core/shared_preferences/cach_helper.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../../../widgets/title_text.dart';
import '../../../../home/pre/view/unit_details.dart';
import '../../../../my_fav/data/repo/favorite_repo.dart';
import '../../../../my_fav/pre/view_model/my_favorite_cubit.dart';
import '../../../../my_fav/pre/view_model/my_favorite_state.dart';

class SearchResultCard extends StatelessWidget {
  final Data data;

  const SearchResultCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoriteRepository()),
      child: SearchResultCardContent(data: data));
  }
}

class SearchResultCardContent extends StatefulWidget {
  final Data data;

  const SearchResultCardContent({super.key, required this.data});

  @override
  State<SearchResultCardContent> createState() =>
      _SearchResultCardContentState();
}

class _SearchResultCardContentState extends State<SearchResultCardContent> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final loc = context.loc;
    return SizedBox(
      width: screenWidth * 0.8,
      child: Stack(
        children: [
          Card(
            color: AppColors.backGround(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child:
                      widget.data.images!.isNotEmpty
                          ? CarouselSlider(
                            options: CarouselOptions(
                              height: screenHeight * 0.18,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: true,
                              autoPlay: false,
                            ),
                            items:
                                widget.data.images!.map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.network(
                                        imageUrl,
                                        width: screenWidth,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  );
                                }).toList(),
                          )
                          : Container(
                            height: screenHeight * 0.18,
                            width: screenWidth * 0.8,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported),
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data.type ?? '',
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 8.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${widget.data.price} EGP",
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 17.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.backGround(context),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          widget.data.address ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.title(
                            context,
                          ).copyWith(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.king_bed_outlined,
                        size: 20,
                        color: AppColors.titleColor(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.data.numberOfBedrooms},",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.bathtub_outlined,
                        size: 16,
                        color: AppColors.titleColor(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.data.numberOfBathrooms}",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.maps_home_work_outlined,
                        size: 16,
                        color: AppColors.backGround(context),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.data.unitArea} m²",
                        style: AppTextStyles.title(
                          context,
                        ).copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButtonDef(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  UnitDetailsPage(unitId: widget.data.id!),
                        ),
                      );
                      // context.push(
                      //   AppRoutes.unitDetails.replaceFirst(
                      //     ':id',
                      //     widget.data.id.toString(),
                      //   ),
                      // );
                    },
                    text: 'Learn More',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: BlocConsumer<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                if (state is FavoriteSuccess) {
                  setState(() {});
                }
              },
              builder: (context, state) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backGround(context),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black(context),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.data.isFavorite!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            widget.data.isFavorite! ? Colors.red : Colors.red,
                        size: 24,
                      ),
                    ),
                    onTap: () {
                      final token = CacheHelper.getSaveData(key: "token");

                      if (token != null && token.isNotEmpty) {
                        context.read<FavoriteCubit>().addToFavorite(
                          widget.data.id.toString(),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                backgroundColor: AppColors.backGround(context),
                                title: TitleText(title: loc.translate("alert")),
                                content: TitleText(
                                  title: loc.translate("to_add_favorite"),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: TitleText(
                                      title: loc.translate("cancel"),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary(
                                        context,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      context.go(AppRoutes.login);
                                    },
                                    child: TitleText(
                                      title: loc.translate("login"),
                                    ),
                                  ),
                                ],
                              ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),

          // .......................
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<FavoriteCubit>().addToFavorite(
                    widget.data.id.toString(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backGround(context),
                    boxShadow: [
                      BoxShadow(color: AppColors.black(context), blurRadius: 4),
                    ],
                  ),
                  child: BlocConsumer<FavoriteCubit, FavoriteState>(
                    listener: (context, state) {
                      if (state is FavoriteSuccess) {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      }
                    },
                    builder: (context, state) {
                      return Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 24,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
