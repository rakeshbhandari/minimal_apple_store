import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_apple_store/model/product_model.dart';

List<ProductModel> cart = [];

class CartNotifier extends StateNotifier<List<ProductModel>> {
  CartNotifier() : super(cart);

  void addToCart(ProductModel productModel) {
    state = [...state, productModel];
  }

  void removeFromCart(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }

  void clearCart() {
    state = [];
  }
}

final CartProvider =
    StateNotifierProvider<CartNotifier, List<ProductModel>>((ref) {
  return CartNotifier();
});

final priceProvider = StateProvider<double>((ref) {
  final cart = ref.watch(CartProvider);

  double sum = 0;
  for (var element in cart) {
    sum += element.price;
  }
  return sum;
});
