import 'package:trenda/core/app_export.dart';
import '../../../user/model/user_post_model.dart';
import '../../models/response_models/get_all_posting_response_body.dart';

class ProductProfileDetailsPage extends StatefulWidget {
  const ProductProfileDetailsPage({super.key});

  @override
  State<ProductProfileDetailsPage> createState() =>
      _ProductProfileDetailsState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const ProductProfileDetailsPage(),
    );
  }
}

class _ProductProfileDetailsState extends State<ProductProfileDetailsPage> {
  late Data _item;

  @override
  Widget build(BuildContext context) {
    _item = ModalRoute.of(context)?.settings.arguments as Data;
    debugPrint(':::::::::::::::::::::::$_item');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: AppDecoration.bg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: AppDecoration.outlineBlueGray,
                child: CustomAppBar(
                  height: 40.h,
                  leadingWidth: 40.h,
                  leading: AppbarLeadingImage(
                    imagePath: ImageConstant.imgFrame,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      top: 3.v,
                      bottom: 3.v,
                    ),
                  ),
                  centerTitle: true,
                  title: AppbarTitleImage(
                    imagePath: ImageConstant.imgTrendaLogoUp2,
                  ),
                  actions: [
                    AppbarTrailingImage(
                      imagePath: ImageConstant.imgNotification,
                      margin: EdgeInsets.symmetric(
                        horizontal: 18.h,
                        vertical: 5.v,
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgAvatar80x80,
                width: SizeUtils.width,
              ),
              buildWidgetSpace(),
              _buildAboutTheSeller(context),
              buildWidgetSpace(),
              _buildShareSocialLink(context),
              buildWidgetSpace(),
              _buildSafetyTips(context),
              // _buildMyShopListings(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutTheSeller(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 11.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 4.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              "msg_samuel_enterprise".tr,
                              style: CustomTextStyles.bodyMediumBluegray500,
                            ),
                          ),
                          buildWidgetSpace(width: 10),
                          CustomImageView(
                            imagePath: ImageConstant.imgVerify,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            color: appThemeColors.greenA400,
                          ),
                        ],
                      ),
                      SizedBox(height: 11.v),
                      Padding(
                        padding: EdgeInsets.only(right: 5.h),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgLocation,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 2.v,
                              ),
                              child: Text(
                                "msg_kejetia_ashanti".tr,
                                style: CustomTextStyles.noticeTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextButton(
                  leftIcon: buildIconData('assets/images/google_ico.png',
                      size: 10.adaptSize, onPressed: () {}),
                  text: '023454566',
                  style: null,
                ),
              ),
              Expanded(
                child: CustomTextButton(
                  leftIcon: buildIconData('assets/images/google_ico.png',
                      size: 10.adaptSize, onPressed: () {}),
                  text: '023454566',
                  style: null,
                  alignment: Alignment.centerLeft,
                ),
              )
            ],
          ),
          SizedBox(height: 10.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomTextButton(
                  leftIcon: buildIconData('assets/images/google_ico.png',
                      size: 10.adaptSize, onPressed: () {}),
                  text: 'peacenaker@gmail.com',
                  style: null,
                  alignment: Alignment.centerLeft,
                ),
              ),
              buildWidgetSpace(width: 10),
              Expanded(
                child: CustomTextButton(
                  leftIcon: CustomImageView(
                    imagePath: 'assets/images/img_globe.svg',
                    color: null,
                  ),
                  text: 'peacemaker.com',
                  style: null,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.v),
          Text(
            "msg_account_engagement".tr,
            style: appThemeData.textTheme.bodyMedium,
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Container(
              height: 8.v,
              width: 320.h,
              decoration: BoxDecoration(
                color: appThemeColors.gray100,
                borderRadius: BorderRadius.circular(
                  4.h,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  4.h,
                ),
                child: LinearProgressIndicator(
                  value: 0.66,
                  backgroundColor: appThemeColors.gray100,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    appThemeColors.greenA40001,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 19.v),
          Row(
            children: [
              Text(
                "lbl_last_seen".tr,
                style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
              ),
              Padding(
                padding: EdgeInsets.only(left: 71.h),
                child: Text(
                  "lbl_joined_trenda".tr,
                  style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Row(
            children: [
              Text(
                "lbl_1_day_ago".tr,
                style: appThemeData.textTheme.bodyMedium,
              ),
              Padding(
                padding: EdgeInsets.only(left: 62.h),
                child: Text(
                  "lbl_sept_15_2023".tr,
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShareSocialLink(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 15.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_share_social_links".tr,
            style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
          ),
          SizedBox(height: 22.v),
          Row(
            children: [
              CustomIconButton(
                height: 28.adaptSize,
                width: 28.adaptSize,
                padding: EdgeInsets.all(6.h),
                decoration: IconButtonStyleHelper.outlinePrimary,
                child: CustomImageView(
                  imagePath: ImageConstant.imgSocialIcon,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: CustomIconButton(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgXLogoSvg,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: CustomIconButton(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.fillLightBlue,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLink,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatSupportAsSoonAs(BuildContext context) {
    return CustomTextButton(
      height: 36.v,
      text: "msg_chat_support_as".tr,
      leftIcon: buildIconData('assets/images/google_ico.png',
          size: 10.adaptSize, onPressed: () {}),
      style: null,
    );
  }

  Widget _buildSafetyTips(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 15.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_safety_tips".tr,
            style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(right: 5.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWarningDiamond,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_confirm_seller_contact".tr,
                    style: appThemeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWarningDiamond,
                height: 16.adaptSize,
                width: 16.adaptSize,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "msg_meet_in_public_places".tr,
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWarningDiamond,
                height: 16.adaptSize,
                width: 16.adaptSize,
                color: Colors.red,
                margin: EdgeInsets.only(top: 1.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "msg_research_the_seller".tr,
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 5.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWarningDiamond,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  color: Colors.red,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_avoid_wiring_money".tr,
                    style: appThemeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWarningDiamond,
                height: 16.adaptSize,
                width: 16.adaptSize,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "msg_inspect_the_item".tr,
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 25.v),
          _buildChatSupportAsSoonAs(context),
        ],
      ),
    );
  }

  Widget _buildMyShopListings(BuildContext context) {
    final item = [_item];
    return ListView.builder(
      itemCount: (item.length / 2).ceil(), // Display two items per row
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: buildItemCard(context, item[index * 2], index * 2),
            ),
            const SizedBox(width: 8), // Adjust spacing between items
            Expanded(
              child: (index * 2 + 1 < item.length)
                  ? buildItemCard(context, item[index * 2 + 1], index * 2 + 1)
                  : const SizedBox(), // Check if the next item exists
            ),
          ],
        );
      },
    );
  }

  Widget buildItemCard(BuildContext context, Data item, int index) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8.adaptSize),
        child: Padding(
          padding: EdgeInsets.all(8.adaptSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomImageView(
                    radius: BorderRadius.all(Radius.circular(5.adaptSize)),
                    imagePath: item.uploadedFiles?[0].url,
                  ), // Background image
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      label: Text(
                        item.packageType!,
                        style: CustomTextStyles.noticeTextStyle
                            .copyWith(fontSize: 10.fSize),
                      ),
                      backgroundColor:
                          appThemeColors.greenA100, // Tag background color
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: 3,
                    child: Card.filled(
                      elevation: 5.adaptSize,
                      shape: CircleBorder(
                          side: BorderSide(color: appThemeColors.whiteA700)),
                      child: IconButton(
                        color: appThemeColors.greenA400,
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {
                          // Handle bookmark action
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ghc ${item.amount}',
                        style: CustomTextStyles.itemHeaderTextStyle),
                    Text(
                      item.postTitle!,
                      style: CustomTextStyles.bodySmallBluegray800,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Chip(
                            side: const BorderSide(color: Colors.white),
                            label: Text(
                              item.itemCondition!,
                              style: CustomTextStyles.noticeTextStyle
                                  .copyWith(fontSize: 10.fSize),
                            ),
                            backgroundColor: appThemeColors
                                .gray10001, // Tag background color
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Chip(
                            side: const BorderSide(color: Colors.white),
                            label: Text(
                              item.category!,
                              style: CustomTextStyles.noticeTextStyle
                                  .copyWith(fontSize: 10.fSize),
                            ),
                            backgroundColor: appThemeColors
                                .greenA100, // Tag background color
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        NavigatorService.pushNamed(
          AppRoutes.productDetailsPage,
          arguments: item,
        );
        debugPrint('Hey xup?');
      },
    );
  }
}
