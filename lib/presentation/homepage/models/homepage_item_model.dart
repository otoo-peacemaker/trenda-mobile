import '../../../../../core/utils/image_constant.dart';

/// This class is used in the [homepagelatesttabcontainer_item_widget] screen.
class HomepageItemModel {
  HomepageItemModel({
    this.general,
    this.general1,
    this.adsCounter,
    this.general2,
    this.agricFood,
    this.adsCounter1,
    this.id,
  }) {
    general = general ?? ImageConstant.imgFda422ddD50c4;
    general1 = general1 ?? "General";
    adsCounter = adsCounter ?? "10 Ads";
    general2 = general2 ?? ImageConstant.img20851e26A1714;
    agricFood = agricFood ?? "Agric & \nFood";
    adsCounter1 = adsCounter1 ?? "10 Ads";
    id = id ?? "";
  }

  String? general;

  String? general1;

  String? adsCounter;

  String? general2;

  String? agricFood;

  String? adsCounter1;

  String? id;
}
