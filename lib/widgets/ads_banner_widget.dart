import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/theme.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Apple Store',
                    style: AppTheme.kBigTitle,
                  ),
                  const Gap(8),
                  Text(
                      'Find the best Apple products and accessories for your ecosystem.',
                      style:
                          AppTheme.kBodyText.copyWith(color: kLightBackground)),
                  const Gap(4),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kLightBackground,
                          foregroundColor: kSecondaryColor),
                      onPressed: () {},
                      child: const Text(
                        'Shop Now',
                      ))
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/general/landing.png',
          )
        ],
      ),
    );
  }
}
