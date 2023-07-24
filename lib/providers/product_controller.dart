import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/product_list.dart';
import '../model/product_model.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

//isSelect change state
  void isSelectItem(int pid, int index) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !state[index].isSelected)
        else
          product,
    ];
  }

  void incrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(qty: product.qty += 1)
        else
          product,
    ];
  }

  void decrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(qty: product.qty -= 1)
        else
          product,
    ];
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
