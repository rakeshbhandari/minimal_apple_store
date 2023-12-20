import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:minimal_apple_store/providers/itembag_controller.dart';

import '../constants/theme.dart';
import '../providers/product_controller.dart';
import 'home_page.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});

  int getIndex;
  late bool _isShowingSearch = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final products = ref.watch(productNotifierProvider);
    final cart = ref.watch(CartProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLightBackground,
          elevation: 0,
          title: const Text('Products Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.local_mall,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(
                            () {
                              _isShowingSearch = !_isShowingSearch;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _isShowingSearch,
                  child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      child: const Row(
                        children: [
                          Text('yo search bar ho'),
                          Icon(Icons.search)
                        ],
                      ))),
              Container(
                height: 300,
                width: double.infinity,
                color: kLightGreen,
                child: Image.asset(products[getIndex].imgURl),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[getIndex].title,
                        style:
                            AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          RatingBar(
                              itemSize: 20,
                              initialRating: 3.1,
                              minRating: 1,
                              maxRating: 5,
                              allowHalfRating: true,
                              ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  half: const Icon(
                                    Icons.star_half_sharp,
                                    color: Colors.amber,
                                  ),
                                  empty: const Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                  )),
                              onRatingUpdate: (value) {}),
                          const Gap(12),
                          const Text('128 reviews'),
                        ],
                      ),
                      Text(
                        products[getIndex].longDescription,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${products[getIndex].price * products[getIndex].qty}',
                            style: AppTheme.kHeadingOne,
                          ),
                          Container(
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(productNotifierProvider.notifier)
                                        .decrementQty(products[getIndex].pid);
                                  },
                                  icon: const Icon(
                                    Icons.do_not_disturb_on_outlined,
                                    size: 30,
                                  )),
                              Text(
                                products[getIndex].qty.toString(),
                                style:
                                    AppTheme.kCardTitle.copyWith(fontSize: 24),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(productNotifierProvider.notifier)
                                        .incrementQty(products[getIndex].pid);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    size: 30,
                                  )),
                            ]),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              minimumSize: const Size(double.infinity, 60)),
                          onPressed: () {
                            ref
                                .read(CartProvider.notifier)
                                .addToCart(products[getIndex]);
                            Get.to(() => const HomePage());
                          },
                          child: const Text('Add to cart'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => ref
                .read(currentIndexProvider.notifier)
                .update((state) => value),
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kSecondaryColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Favourites',
                activeIcon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notifications',
                activeIcon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
                activeIcon: Icon(Icons.person),
              ),
            ]));
  }
}
