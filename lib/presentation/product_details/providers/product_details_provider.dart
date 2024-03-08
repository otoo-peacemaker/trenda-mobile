import 'package:flutter/material.dart';

import '../models/product_details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  ProductDetailsModel productDetailsModelObj = ProductDetailsModel();

  @override
  void dispose() {
    super.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    for (var element in productDetailsModelObj.frameItemList) {
      element.isSelected = false;
    }
    productDetailsModelObj.frameItemList[index].isSelected = value;
    notifyListeners();
  }
}
