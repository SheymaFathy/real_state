import 'package:flutter/material.dart';
import '../../../../../../../core/app_localization/app_localization.dart';
import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/styles.dart';
import '../../../../../../widgets/title_text.dart';
import 'all_ads_page.dart';

class HotDealRow extends StatelessWidget {
  const HotDealRow({
    super.key,
    required this.local,
  });

  final AppLocalizations local;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TitleText(title: local.translate('Hot_deals'),)),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllAdsPage(),
                ),
              );
            },
            child: Text( local.translate('show_More'),
              style: AppTextStyles.body(context).copyWith(color:AppColors.primary(context)),
            ),
          ),
        ],
      ),
    );
  }
}