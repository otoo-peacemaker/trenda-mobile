import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/user/model/user_post_model.dart';
import '../../../user/endpoints.dart';
import '../../homepage.dart';
import '../../models/response_models/get_all_posting_response_body.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const ProductDetailsPage(),
    );
  }
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  late PostingDataResponse _item;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final PostingDataResponse item =
        ModalRoute.of(context)?.settings.arguments as PostingDataResponse;
    _item = item;

    final List<String>? labels = _item.postPath?.split('/');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: AppDecoration.bg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(context, postingDataResponse: [_item]),
              SizedBox(
                height: 80.adaptSize,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: labels?.length,
                    itemBuilder: (context, index) {
                      return Chip(
                        side: BorderSide(
                            width: 0.5.adaptSize, color: Colors.grey),
                        label: Text(
                          labels![index],
                          style: CustomTextStyles.noticeTextStyle,
                        ),
                      );
                    }),
              ),
              _buildPreviewProductImg(),
              SizedBox(
                height: 200.adaptSize,
                child: _buildDetailFrame(context, _item),
              ),
              _buildFeatures(context),
              buildWidgetSpace(),
              _buildAboutTheSeller(context),
              buildWidgetSpace(),
              _buildShareSocialLink(context),
              buildWidgetSpace(),
              _buildSafetyTips(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewProductImg() {
    final List<String> images = [];
    _item.uploadedFiles?.forEach((element) {
      images.add(element.url!);
    });

    return flexiProductimageSlider(
      //required fields
      arrayImages: images,
      // optional fields
      //set where you want to set your thumbnail
      sliderStyle: SliderStyle.nextToSlider,
      //.overSlider, .nextToSlider
      // set you slider height like 1.0,1.5,2.0 etc...
      aspectRatio: 1.0.adaptSize,
      //set content mode of image
      boxFit: BoxFit.cover,
      //set this if you want to set any default image index when it loads
      selectedImagePosition: 0,
      //set your thumbnail alignment
      thumbnailAlignment: ThumbnailAlignment.bottom,
      //.right , .left, .bottom
      //set how selected thumbnail border displayed
      thumbnailBorderType: ThumbnailBorderType.all,
      //.bottom, .all
      //set selected thumbnail border width
      thumbnailBorderWidth: 1.8.adaptSize,
      //double value
      //set thumbnail corner radius
      thumbnailBorderRadius: 10.adaptSize,
      //set your thumbnail height & width
      //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
      thumbnailWidth: 80.adaptSize,
      thumbnailHeight: 80.adaptSize,
      //set color of current image thumbnail border
      thumbnailBorderColor: Colors.blue,
      //make you action when user click on image
      onTap: (index) {
        debugPrint("selected index : $index");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => galleryZoomSlides(
              //required fields
              arrayImages: images,
              //Optional fields
              zoomTheme: ZoomTheme.theme3, //.theme1, .theme2, .theme3
              selectedImagePosition: index,
              selectedThumbnailColor: Colors.blue,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailFrame(BuildContext context, PostingDataResponse item) {
    bool isBookedMarked = false;
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 11.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 1.v,
                    bottom: 5.v,
                  ),
                  child: Text(
                    "${item.postTitle}".tr,
                    style: CustomTextStyles.textButtonTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Card.filled(
                  elevation: 5.adaptSize,
                  shape: CircleBorder(
                      side: BorderSide(color: appThemeColors.whiteA700)),
                  child: IconButton(
                    color: isBookedMarked
                        ? appThemeColors.greenA400
                        : appThemeColors.gray400,
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      // Handle bookmark action
                      setState(() {
                        isBookedMarked = !isBookedMarked;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Ghc ${item.amount}".tr,
                style: CustomTextStyles.bodyMediumGilroyRegular
                    .copyWith(color: appThemeColors.greenA700),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 4.v,
                ),
                child: Text(
                  "Negotiable: ${item.negotiable}".tr,
                  style: CustomTextStyles.bodySmallBlueGray900,
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
                    "${item.address}".tr,
                    style: CustomTextStyles.noticeTextStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 20.adaptSize,
                width: 20.adaptSize,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                ),
                child: Text(
                  "${item.postViews} Views".tr,
                  style: CustomTextStyles.noticeTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.h, 13.v, 40.h, 12.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_features".tr,
            style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
          ),
          SizedBox(height: 10.v),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildFeatureRows(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFeatureRows() {
    final List<Widget> rows = [];
    final List<FeatureList>? featureList = _item.featureList;
    if (featureList != null) {
      for (int i = 0; i < featureList.length; i += 3) {
        final rowWidgets = _buildKeyValuePairRow(featureList, i);
        rows.add(rowWidgets);
      }
    }
    return rows;
  }

  Widget _buildKeyValuePairRow(List<FeatureList> featureList, int startIndex) {
    final List<Widget> rowWidgets = [];
    for (int i = startIndex;
        i < startIndex + 3 && i < featureList.length;
        i++) {
      final feature = featureList[i];
      rowWidgets.add(_buildKeyValuePair(feature.key!, feature.value!));
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8.v),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowWidgets,
      ),
    );
  }

  Widget _buildKeyValuePair(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: CustomTextStyles.bodySmallBlueGray900,
        ),
        SizedBox(height: 2.v),
        Text(
          value,
          style: CustomTextStyles.bodyMediumBluegray500,
        ),
      ],
    );
  }

  Widget _buildAboutTheSeller(BuildContext context) {
    final slug = _item.url;
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return FutureBuilder<GetPostBySlugResponseBody?>(
          future: provider.getUserPostBySlug(endpoints: singleUser, path: slug),
          builder: (context, snapshot) {
            final data = snapshot.data?.data;
            final user = data?.user;
            debugPrint('::::::::::::::::::::;${user?.name}');
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 11.v),
              decoration: AppDecoration.outlineBluegray501,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4.v),
                  Text(
                    "${user?.name}".tr,
                    style:
                        CustomTextStyles.bodySmallGilroyRegularErrorContainer,
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.only(right: 7.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              NavigatorService.pushNamed(
                                  AppRoutes.productProfileDetailsPage,
                                  arguments: data);
                            },
                            child: CustomImageView(
                              margin: const EdgeInsets.all(5),
                              imagePath: ImageConstant.imgAvatar,
                              height: 56.adaptSize,
                              width: 56.adaptSize,
                              radius: BorderRadius.circular(
                                20.h,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 4.h,
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
                                        "${user?.name}".tr,
                                        style: CustomTextStyles
                                            .bodyMediumBluegray500,
                                      ),
                                    ),
                                    buildWidgetSpace(width: 10),
                                    Chip(
                                      backgroundColor: Colors.orange,
                                      side: BorderSide(
                                        width: 0.5.adaptSize,
                                        color: Colors.transparent,
                                      ),
                                      label: Text(
                                        "${data?.packageType}".tr,
                                        style: CustomTextStyles.noticeTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11.v),
                                Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgVerify,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      color: appThemeColors.greenA400,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.h,
                                        bottom: 2.v,
                                      ),
                                      child: user!.userVerifiedById == true
                                          ? Text(
                                              "msg_account_verified".tr,
                                              style: CustomTextStyles
                                                  .bodyMediumGilroyRegularGreenA700,
                                            )
                                          : Text(
                                              "Unverified user".tr,
                                              style: CustomTextStyles
                                                  .bodyMediumGilroyRegularGreenA700,
                                            ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11.v),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          leftIcon: buildIconData(
                              'assets/images/google_ico.png',
                              size: 15.adaptSize,
                              onPressed: () {}),
                          text: '${user.mobile}',
                          style: null,
                        ),
                      ),
                      Expanded(
                        child: CustomTextButton(
                          leftIcon: buildIconData(
                              'assets/images/google_ico.png',
                              size: 15.adaptSize,
                              onPressed: () {}),
                          text: '${user.mobile}',
                          style: null,
                          alignment: Alignment.centerLeft,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.v),
                  CustomTextButton(
                    leftIcon: buildIconData('assets/images/google_ico.png',
                        size: 15.adaptSize, onPressed: () {}),
                    text: '${data?.socialLink}',
                    style: null,
                    alignment: Alignment.centerLeft,
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
                          value: data!.postImpressions?.toDouble(),
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
                        style: CustomTextStyles
                            .bodySmallGilroyRegularErrorContainer,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 71.h),
                        child: Text(
                          "lbl_joined_trenda".tr,
                          style: CustomTextStyles
                              .bodySmallGilroyRegularErrorContainer,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
                  Row(
                    children: [
                      Text(
                        "${user.lastLogin?.day} day(s) ago".tr,
                        style: appThemeData.textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 62.h),
                        child: Text(
                          "${user.createdAt}".tr,
                          style: appThemeData.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    });
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
    return CustomOutlinedButton(
      height: 36.v,
      text: "msg_chat_support_as".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgMessagefill,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGreenA,
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
            padding: EdgeInsets.only(right: 88.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWarningDiamond,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
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
                margin: EdgeInsets.only(top: 1.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  "msg_research_the_seller".tr,
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 58.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWarningDiamond,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.h),
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
}
