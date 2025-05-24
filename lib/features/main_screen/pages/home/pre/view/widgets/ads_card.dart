import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/helper/context_extensions.dart';
import 'package:real_state/features/main_screen/pages/my_fav/data/repo/favorite_repo.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../widgets/elevated_button_def.dart';
import '../../../../my_fav/pre/view_model/my_favorite_state.dart';
import '../../../data/model/unit_model.dart';
import '../../../../my_fav/pre/view_model/my_favorite_cubit.dart';
import '../unit_details.dart';

class AdsCard extends StatelessWidget {
  final UnitModel unit;

  const AdsCard({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoriteRepository()),
      child: AdsCardContent(unit: unit),
    );
  }
}

class AdsCardContent extends StatefulWidget {
  final UnitModel unit;
  const AdsCardContent({super.key, required this.unit});

  @override
  State<AdsCardContent> createState() => _AdsCardContentState();
}

class _AdsCardContentState extends State<AdsCardContent> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
  }

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
                  child: widget.unit.imageUrl.isNotEmpty
                      ? CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * 0.18,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: widget.unit.imageUrl.map((imageUrl) {
                      return Image.network(
                        imageUrl,
                        height: screenHeight * 0.18,
                        width: screenWidth,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.broken_image),
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
                    widget.unit.type,
                    style: AppTextStyles.title(context).copyWith(fontSize: 8.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${widget.unit.price} EGP",
                    style: AppTextStyles.title(context).copyWith(fontSize: 17.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16, color: AppColors.backGround(context)),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          widget.unit.address ,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.title(context).copyWith(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.king_bed_outlined, size: 20, color: AppColors.titleColor(context)),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.unit.numOfRooms},",
                        style: AppTextStyles.title(context).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(Icons.bathtub_outlined, size: 16, color: AppColors.titleColor(context)),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.unit.numOfBathrooms}",
                        style: AppTextStyles.title(context).copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 15.w),
                      Icon(Icons.maps_home_work_outlined, size: 16, color: AppColors.backGround(context)),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.unit.unitArea} m²",
                        style: AppTextStyles.title(context).copyWith(fontSize: 12.sp),
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
                          builder: (context) => UnitDetailsPage(unitId: widget.unit.id),
                        ),
                      );
                    },
                    text: loc.translate("learn_more"),
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
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                }
              },
              builder: (context, state) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      context.read<FavoriteCubit>()
                          .addToFavorite(widget.unit.id.toString());
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
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
