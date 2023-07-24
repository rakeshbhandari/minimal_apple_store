import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:minimal_apple_store/model/product_model.dart';
import 'package:minimal_apple_store/providers/itembag_controller.dart';

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
                        onPressed: () {
                          ref
                              .read(productNotifierProvider.notifier)
                              .isSelectItem(
                                  product[productIndex].pid, productIndex);

                          if (product[productIndex].isSelected == false) {
                            ref.read(CartProvider.notifier).addToCart(
                                ProductModel(
                                    pid: product[productIndex].pid,
                                    imgURl: product[productIndex].imgURl,
                                    title: product[productIndex].title,
                                    price: product[productIndex].price,
                                    shortDescription:
                                        product[productIndex].shortDescription,
                                    longDescription:
                                        product[productIndex].longDescription,
                                    review: product[productIndex].review,
                                    rating: product[productIndex].rating));
                          } else {
                            ref
                                .read(CartProvider.notifier)
                                .removeFromCart(product[productIndex].pid);
                          }
                        },
                        icon: Icon(
                          product[productIndex].isSelected
                              ? Icons.check_circle
                              : Icons.add_circle,
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
