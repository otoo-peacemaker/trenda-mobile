import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import '../models/sliderframe_item_model.dart';

// ignore: must_be_immutable
class SliderframeItemWidget extends StatelessWidget {
  SliderframeItemWidget(
    this.sliderframeItemModelObj, {
    super.key,
  });

  SliderframeItemModel sliderframeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "msg_one_stop_shopping".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 7.v),
        SizedBox(
          width: 303.h,
          child: Text(
            "msg_quickly_and_effortlessly".tr,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumGilroySemiBoldOnPrimary.copyWith(
              height: 1.43,
            ),
          ),
        ),
      ],
    );
  }
}
