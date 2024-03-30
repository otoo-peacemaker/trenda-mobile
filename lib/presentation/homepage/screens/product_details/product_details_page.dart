import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/user/model/user_post_model.dart';
import '../../../user/endpoints.dart';
import '../../widgets/build_header.dart';
import '../homepage_screen.dart';
import '../../models/response_models/get_all_posting_response_body.dart';
import '../products_list_screen.dart';

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
              buildHeader(context,
                  color: Colors.white, postingDataResponse: [_item], onTap: () {
                NavigatorService.goBack();
              }),
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
              _buildSafetyTips(context),
              _buildRelatedProducts(),
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
      padding: EdgeInsets.fromLTRB(16.h, 5.v, 16.h, 11.v),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "${item.postTitle}".tr,
                    style: TextStyle(
                      color: const Color(0xFF344054),
                      fontSize: 18.fSize,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w500,
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
          ),
          Row(
            children: [
              Text(
                "Ghc ${item.amount}".tr,
                style: TextStyle(
                  color: const Color(0xFF00B557),
                  fontSize: 18.fSize,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                (item.negotiable == true) ? " Negotiable".tr : "",
                style: CustomTextStyles.bodySmallBlueGray900,
              ),
            ],
          ),
          SizedBox(height: 10.v),
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
      padding: EdgeInsets.all(15.adaptSize),
      decoration: AppDecoration.outlineBluegray501,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_features".tr,
            style: TextStyle(
              color: const Color(0xFF1D2939),
              fontSize: 12.fSize,
              fontFamily: 'Gilroy-Regular',
              fontWeight: FontWeight.w500,
            ),
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
          style: TextStyle(
            color: const Color(0xFF667085),
            fontSize: 12.fSize,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2.v),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF344054),
            fontSize: 14.fSize,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w500,
          ),
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
              padding: EdgeInsets.all(1.adaptSize),
              margin: EdgeInsets.symmetric(horizontal: 15.h),
              decoration: AppDecoration.outlineBluegray501,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ABOUT THE SELLER".tr,
                    style:
                        CustomTextStyles.bodySmallGilroyRegularErrorContainer,
                  ),
                  SizedBox(height: 20.v),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomImageView(
                              height: 60.v,
                              width: 60.h,
                              imagePath: ImageConstant.imgAvatar,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(5.adaptSize),
                            ),
                            buildWidgetSpace(width: 10),
                            Column(
                              children: [
                                Text(
                                  softWrap: true,
                                  "${user?.name}".tr,
                                  style: TextStyle(
                                    color: const Color(0xFF475467),
                                    fontSize: 16.fSize,
                                    fontFamily: 'Gilroy-Medium',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Chip(
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  avatar: CustomImageView(
                                    imagePath: ImageConstant.imgVerify,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    color: appThemeColors.greenA400,
                                  ),
                                  label: user!.userVerifiedById == true
                                      ? Text(
                                          "msg_account_verified".tr,
                                          style: TextStyle(
                                            color: const Color(0xFF475467),
                                            fontSize: 14.fSize,
                                            fontFamily: 'Gilroy-Regular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : Text("Unverified user".tr,
                                          style: TextStyle(
                                            color: const Color(0xFF475467),
                                            fontSize: 14.fSize,
                                            fontFamily: 'Gilroy-Regular',
                                            fontWeight: FontWeight.w500,
                                          )),
                                ),
                              ],
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        leftIcon: CustomImageView(
                          imagePath: ImageConstant.imgPhone,
                          height: 20.v,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        text: '${user.mobile}',
                        style: null,
                      ),
                      SizedBox(width: 10.v),
                      Expanded(
                        child: CustomTextButton(
                          leftIcon: CustomImageView(
                            height: 20.v,
                            imagePath: ImageConstant.imgWhatsapp,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          text: '${user.mobile}',
                          style: null,
                          alignment: Alignment.centerLeft,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.v),
                  CustomTextButton(
                    leftIcon: CustomImageView(
                      height: 20.v,
                      imagePath: ImageConstant.imgSocialIconRed50001,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    text: '${"nanakwesiotoo@gmail.com"}',
                    style: null,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    "msg_account_engagement".tr,
                    style: TextStyle(
                      color: const Color(0xFF344054),
                      fontSize: 14.fSize,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w500,
                    ),
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
                          value: (data!.postImpressions! / 100).toDouble(),
                          backgroundColor: appThemeColors.gray10001,
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
                      Text("lbl_last_seen".tr,
                          style: TextStyle(
                            color: const Color(0xFF344054),
                            fontSize: 12.fSize,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w500,
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 71.h),
                        child: Text(
                          "lbl_joined_trenda".tr,
                          style: TextStyle(
                            color: const Color(0xFF667085),
                            fontSize: 12.fSize,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.lastLogin?.day} day(s) ago".tr,
                        style: TextStyle(
                          color: const Color(0xFF344054),
                          fontSize: 14.fSize,
                          fontFamily: 'Gilroy-Medium',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.h),
                        child: Text(
                          DateFormat('MMM dd yyyy').format(user.createdAt!).tr,
                          style: TextStyle(
                            color: const Color(0xFF344054),
                            fontSize: 14.fSize,
                            fontFamily: 'Gilroy-Medium',
                            fontWeight: FontWeight.w500,
                          ),
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
            style: TextStyle(
              color: const Color(0xFF1D2939),
              fontSize: 12.fSize,
              fontFamily: 'Gilroy-Regular',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              CustomImageView(
                height: 28.adaptSize,
                width: 28.adaptSize,
                imagePath: 'assets/images/img_share_fb.svg',
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: CustomImageView(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  imagePath: 'assets/images/img_share_twitter.svg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: CustomImageView(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  imagePath: 'assets/images/img_share_linkendIn.svg',
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
      buttonStyle: OutlinedButton.styleFrom(
        side: BorderSide(
          color: appThemeColors.greenA700,
        ),
        backgroundColor: Colors.transparent,
        textStyle: appThemeData.textTheme.bodyMedium?.copyWith(
          fontSize: 14.fSize,
          color: appThemeColors.blueGray900,
        ),
      ),
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
            style: TextStyle(
              color: const Color(0xFF1D2939),
              fontSize: 12.fSize,
              fontFamily: 'Gilroy-Regular',
              fontWeight: FontWeight.w500,
            ),
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
                    style: TextStyle(
                      color: const Color(0xFF344054),
                      fontSize: 14.fSize,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w500,
                    ),
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
                  style: TextStyle(
                    color: const Color(0xFF344054),
                    fontSize: 14.fSize,
                    fontFamily: 'Gilroy-Medium',
                    fontWeight: FontWeight.w500,
                  ),
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
                  style: TextStyle(
                    color: const Color(0xFF344054),
                    fontSize: 14.fSize,
                    fontFamily: 'Gilroy-Medium',
                    fontWeight: FontWeight.w500,
                  ),
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
                    style: TextStyle(
                      color: const Color(0xFF344054),
                      fontSize: 14.fSize,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w500,
                    ),
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
                  style: TextStyle(
                    color: const Color(0xFF344054),
                    fontSize: 14.fSize,
                    fontFamily: 'Gilroy-Medium',
                    fontWeight: FontWeight.w500,
                  ),
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

  Widget _buildRelatedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
          child: Text(
            "Related Products".tr,
            style: TextStyle(
              color: const Color(0xFF344054),
              fontSize: 16.fSize,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 400.v, child: ProductListScreen.builder(context))
      ],
    );
  }
}
