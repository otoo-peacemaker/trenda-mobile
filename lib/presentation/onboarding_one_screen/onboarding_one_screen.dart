import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import 'models/sliderframe_item_model.dart';
import 'provider/onboarding_one_provider.dart';
import 'widgets/sliderframe_item_widget.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({super.key});

  @override
  OnboardingOneScreenState createState() => OnboardingOneScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardingOneProvider(),
        child: const OnboardingOneScreen());
  }
}

class OnboardingOneScreenState extends State<OnboardingOneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 24.v),
                  decoration: AppDecoration.gradientPrimaryToPrimary,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      _buildSliderFrame(context),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 32.v,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: 0,
                                  count: 3,
                                  effect: ScrollingDotsEffect(
                                      spacing: 12,
                                      activeDotColor: appThemeColors.greenA200,
                                      dotColor:
                                          appThemeData.colorScheme.onPrimary,
                                      dotHeight: 8.v,
                                      dotWidth: 9.h),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onTapTxtNext(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 87.h, top: 4.v, bottom: 7.v),
                                  child: Text("lbl_next".tr,
                                      style: appThemeData.textTheme.bodyLarge),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomImageView(
                  imagePath: ImageConstant.imgOnboarding1,
                  height: 642.v,
                  width: 360.h,
                  alignment: Alignment.topCenter)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSliderFrame(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.h),
      child: Consumer<OnboardingOneProvider>(
        builder: (context, provider, child) {
          return CarouselSlider.builder(
              options: CarouselOptions(
                  height: 126.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    provider.sliderIndex = index;
                  }),
              itemCount:
                  provider.onboardingOneModelObj.sliderframeItemList.length,
              itemBuilder: (context, index, realIndex) {
                SliderframeItemModel model =
                    provider.onboardingOneModelObj.sliderframeItemList[index];
                return SliderframeItemWidget(model);
              });
        },
      ),
    );
  }

  onTapTxtNext(BuildContext context) {
    // TODO: implement Actions
  }
}
