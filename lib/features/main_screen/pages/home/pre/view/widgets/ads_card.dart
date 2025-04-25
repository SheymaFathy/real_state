import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/constants/app_images.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view_model/home_cubit.dart';
import 'package:real_state/features/main_screen/pages/home/pre/view_model/home_state.dart';
import '../../../data/model/unit_model.dart';

class AdsCard extends StatelessWidget {
  final UnitModel unit;

  const AdsCard({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 289,
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
              child: Image.asset(
                AppImages.cardImage,
                height: 135,
                width: 289,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Apartment",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("3000000 EGP/mo"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Cairo", overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4,
              ),
              child: Row(
                children: [
                  Icon(Icons.king_bed_outlined, size: 16),
                  SizedBox(width: 4),
                  Text("${unit.numOfRooms}"),
                  SizedBox(width: 12),
                  Icon(Icons.bathtub_outlined, size: 16),
                  SizedBox(width: 4),
                  Text("${unit.numOfBathrooms}"),
                  SizedBox(width: 12),
                  Icon(Icons.square_foot, size: 16),
                  SizedBox(width: 4),
                  Text("150 m²"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
