import 'package:trenda/core/app_export.dart';
import '../models/response_models/get_posting_by_categories.dart';

// ignore: must_be_immutable
class HomepageItemWidget extends StatelessWidget {
  HomepageItemWidget(
    this.homepageItemModelObj, {
    super.key,
  });

  CategoriesDataModel? homepageItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44.v,
      child: Column(
        children: [
          Expanded(
            child: CustomImageView(
              imagePath: homepageItemModelObj?.iconUrl,
              height: 32.adaptSize,
              width: 32.adaptSize,
            ),
          ),
          SizedBox(height: 12.v),
          Expanded(
              child: Text(
            homepageItemModelObj!.category!,
            style: CustomTextStyles.bodyMediumBluegray500,
          )),
          SizedBox(height: 5.v),
          Expanded(
              child: Text(
            homepageItemModelObj!.count.toString(),
            style: CustomTextStyles.bodyMediumBluegray500,
          )),
          SizedBox(height: 12.v),
          Expanded(
            child: CustomImageView(
              imagePath: homepageItemModelObj?.iconUrl,
              height: 32.adaptSize,
              width: 32.adaptSize,
            ),
          ),
          SizedBox(height: 9.v),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 39.h,
              child: Text(
                homepageItemModelObj!.category!,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
              ),
            ),
          )),
          SizedBox(height: 4.v),
          Expanded(
              child: Text(
            homepageItemModelObj!.count.toString(),
            style: CustomTextStyles.bodySmallBluegray700,
          )),
        ],
      ),
    );
  }
}
