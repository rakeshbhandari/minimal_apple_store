import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:minimal_apple_store/providers/itembag_controller.dart';
import 'package:minimal_apple_store/views/cart_page.dart';

import '../constants/theme.dart';
import '../providers/product_controller.dart';
import '../widgets/ads_banner_widget.dart';
import '../widgets/chip_widget.dart';
import '../widgets/product_card_widget.dart';
import 'details_page.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final cart = ref.watch(CartProvider);
    return Scaffold(
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'The ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'World ',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Studios',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ])),
          elevation: 0,
          centerTitle: true,
          backgroundColor: kWhiteColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Badge(
                label: Text(cart.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    icon: const Icon(
                      Icons.local_mall_outlined,
                      color: Colors.black,
                      size: 24,
                    )),
                    
              ),
            )
          ],
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //ads banner section
                const AdsBannerWidget(),

                //chip widget
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
                      ChipWidget(
                        chipLabel: 'All',
                      ),
                      ChipWidget(
                        chipLabel: 'Laptops',
                      ),
                      ChipWidget(
                        chipLabel: 'Iphones',
                      ),
                      ChipWidget(
                        chipLabel: 'Accesories',
                      ),
                      ChipWidget(
                        chipLabel: 'Smart Watches',
                      ),
                      ChipWidget(
                        chipLabel: 'Ipads',
                      ),
                    ],
                  ),
                ),

                const Gap(12),

                //hot sales
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hot sales', style: AppTheme.kHeadingOne),
                    Text(
                      'See all',
                      style: AppTheme.kSeeAll,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductCardWidget(
                      productIndex: index,
                    ),
                  ),
                ),
                const Gap(12),
                //featured products
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Products', style: AppTheme.kHeadingOne),
                    Text(
                      'See all',
                      style: AppTheme.kSeeAll,
                    ),
                  ],
                ),
                MasonryGridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(getIndex: index))),
                          child: SizedBox(
                            height: 250,
                            child: ProductCardWidget(productIndex: index),
                          ),
                        ))
              ],
            ),
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
