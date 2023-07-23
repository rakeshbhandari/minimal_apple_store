import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/theme.dart';
import '../providers/product_controller.dart';
import 'home_page.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final products = ref.watch(productNotifierProvider);
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
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.local_mall,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            '\$${products[getIndex].price}',
                            style: AppTheme.kHeadingOne,
                          ),
                          Container(
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                          onPressed: () {},
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
