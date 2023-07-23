import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/theme.dart';
import '../providers/product_controller.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);

    return Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 4),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 4,
            ),
          ]),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              color: kLightGreen,
              child: Image.asset(product[productIndex].imgURl),
            ),
          ),
          const Gap(4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product[productIndex].title,
                  style: AppTheme.kCardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product[productIndex].shortDescription,
                  style: AppTheme.kBodyText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product[productIndex].price}',
                      style: AppTheme.kCardTitle,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          size: 30,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
