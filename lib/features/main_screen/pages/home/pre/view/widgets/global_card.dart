import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/my_fav/data/models/fav_model.dart';
import 'package:real_state/features/main_screen/pages/my_fav/pre/view_model/my_favorite_cubit.dart';
import 'package:real_state/features/main_screen/pages/my_fav/pre/view_model/my_favorite_state.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../../core/helper/routes.dart';
import '../../../../../../../core/shared_preferences/cach_helper.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../../../widgets/title_text.dart';
import '../../../data/model/unit_model.dart';

class GlobalCard extends StatefulWidget {
  final UnitModel? unit;
  final FavoriteModel? favoriteModel;
  final int unitId;
  final List<String> imageUrl;
  final String unitType;
  final int price;
  final String address;
  final int numOfRooms;
  final int numOfBathrooms;
  final String unitArea;
  final VoidCallback press;
  final VoidCallback? onRemoveFavorite; // زرار إزالة المفضلة اختياري
  final bool? isFavorite;

  const GlobalCard({
    super.key,
    required this.imageUrl,
    required this.unitType,
    required this.price,
    required this.address,
    required this.numOfRooms,
    this.isFavorite = false,
    required this.numOfBathrooms,
    required this.unitArea,
    required this.press,
    required this.unitId,
    this.unit,
    this.favoriteModel,
    this.onRemoveFavorite,
  });

  @override
  State<GlobalCard> createState() => _GlobalCardState();
}

class _GlobalCardState extends State<GlobalCard> {
  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                      widget.imageUrl.isNotEmpty
                          ? CarouselSlider(
                            options: CarouselOptions(
                              height: screenHeight * 0.18,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                            ),
                            items:
                                widget.imageUrl.map((url) {
                                  return Image.network(
                                    url,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.broken_image,
                                              size: 100,
                                            ),
                                  );
                                }).toList(),
                          )
                          : Container(
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.5,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported),
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.unitType,
                    style: AppTextStyles.title(
                      context,
                    ).copyWith(fontSize: 8.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${widget.price} EGP",
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
                          widget.address,
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
                        "${widget.numOfRooms},",
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
                        "${widget.numOfBathrooms}",
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
                        "${widget.unitArea} m²",
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
                    press: widget.press,
                    text: loc.translate("learn_more"),
                  ),
                ),
              ],
            ),
          ),
          // add to favorite button
          Positioned(
            top: 8.h,
            right: 8.w,
            left: 8.w,
            child: BlocListener<FavoriteCubit, FavoriteState>(
              listenWhen:
                  (state, previousState) =>
                      state is FavoriteSuccess || state is FavoriteError,
              listener: (context, state) {
                if (state is FavoriteSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Added to favorites successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is FavoriteError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Failed to update favorites"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Favorite Icon
                  Material(
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
                        child: GestureDetector(
                          onTap: widget.onRemoveFavorite,
                          child: Icon(
                            widget.isFavorite!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                      onTap: () {
                        final token = CacheHelper.getSaveData(key: "token");

                        if (token != null && token.isNotEmpty) {
                          if (widget.unit != null) {
                            if (!widget.isFavorite!) {
                              context.read<FavoriteCubit>().addToFavorite(
                                widget.unit!.id.toString(),
                              );
                            } else {
                              context.read<FavoriteCubit>().deleteFavorite(
                                widget.unit!.id,
                              );
                            }
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  backgroundColor: AppColors.backGround(
                                    context,
                                  ),
                                  title: TitleText(
                                    title: loc.translate("alert"),
                                  ),
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
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
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
                  ),

                  // Delete Favorite Icon
                  if (widget.unit?.isFavorite ?? false)
                    Material(
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
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                        onTap: () {
                          if (widget.unit != null) {
                            context.read<FavoriteCubit>().deleteFavorite(
                              widget.unit!.id,
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
