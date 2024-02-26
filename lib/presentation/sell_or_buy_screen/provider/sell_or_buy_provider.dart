import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/sell_or_buy_model.dart';

/// A provider class for the SellOrBuyScreen.
///
/// This provider manages the state of the SellOrBuyScreen, including the
/// current sellOrBuyModelObj
class SellOrBuyProvider extends ChangeNotifier {
  SellOrBuyModel sellOrBuyModelObj = SellOrBuyModel();

  @override
  void dispose() {
    super.dispose();
  }
}
