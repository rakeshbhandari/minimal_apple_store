import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:minimal_apple_store/constants/theme.dart';
import 'package:minimal_apple_store/providers/itembag_controller.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(CartProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLightBackground,
          elevation: 0,
          title: const Text('My Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(CartProvider.notifier).clearCart();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 3,
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.asset(cart[index].imgURl)),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart[index].title,
                                      style: AppTheme.kCardTitle,
                                    ),
                                    const Gap(5),
                                    Text(
                                      cart[index].shortDescription,
                                      style: AppTheme.kBodyText,
                                    ),
                                    const Gap(5),
                                    Text('\$${cart[index].price}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Have a coupon code? Enter here'),
                      const Gap(12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: kPrimaryColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'FDS2023',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: const Row(
                                children: [
                                  Text(
                                    'Available',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Gap(5),
                                  Icon(Icons.check_circle)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Free',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'No discount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                          Text(
                            '\$${ref.watch(priceProvider)}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
