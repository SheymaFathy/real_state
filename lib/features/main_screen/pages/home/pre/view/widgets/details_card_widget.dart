import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../../widgets/elevated_button_def.dart';
import '../../../data/model/unit_model.dart';
import '../unit_details.dart';

class AdsDetailsCard extends StatelessWidget {
  final UnitModel unit;

  const AdsDetailsCard ({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: screenWidth * 0.8,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UnitDetailsPage(unitId: unit.id)
                  ),
                );
              },
              child: Card(
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
                      child: unit.imageUrl.isNotEmpty
                          ? Image.network(
                        unit.imageUrl,
                        height: screenHeight * 0.18,
                        width: screenWidth * 1.0,
                        fit: BoxFit.cover,
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
                        unit.type,
                        style: AppFonts.subTitle(locale, isDark: isDark),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${unit.price} EGP",
                        style: AppFonts.title(locale, isDark: isDark),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              unit.address,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.subTitle(locale, isDark: isDark),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.king_bed_outlined, size: 20),
                          SizedBox(width: 4.w),
                          Text("${unit.numOfRooms},", style: AppFonts.title(locale, isDark: isDark)),
                          SizedBox(width: 15.w),
                          const Icon(Icons.bathtub_outlined, size: 16),
                          SizedBox(width: 4.w),
                          Text("${unit.numOfBathrooms}", style: AppFonts.title(locale, isDark: isDark)),
                          SizedBox(width: 15.w),
                          const Icon(Icons.maps_home_work_outlined, size: 16),
                          SizedBox(width: 4.w),
                          Text("${unit.unitArea} m²", style: AppFonts.title(locale, isDark: isDark)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Text(
                        "${unit.datePosted}",
                        style: AppFonts.subTitle(locale, isDark: isDark),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButtonDef(press: () {}, text: 'URL'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.favorite_border, color: Colors.red, size: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
