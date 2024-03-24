import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/homepage/screens/homepage_product_list.dart';
import 'package:trenda/presentation/homepage/widgets/search_widget.dart';
import 'models/response_models/get_all_posting_response_body.dart';
import 'models/response_models/get_posting_by_categories.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.postingDataResponse,
      required this.postingByCategoriesResponse});
  final GetAllPostingResponseBody postingDataResponse;
  final GetPostingByCategoriesResponseBody postingByCategoriesResponse;

  @override
  HomePageState createState() => HomePageState();

  static Widget builder(
      BuildContext context,
      GetAllPostingResponseBody postingDataResponse,
      GetPostingByCategoriesResponseBody postingByCategoriesResponse) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: HomePage(
        postingDataResponse: postingDataResponse,
        postingByCategoriesResponse: postingByCategoriesResponse,
      ),
    );
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: AppDecoration.bg,
          child: Column(
            children: [
              buildHeader(context,
                  postingDataResponse:
                      widget.postingDataResponse.postingResponseData!), //header
              SizedBox(height: 24.h),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      _buildShopNowCardWidget(context), //card widget
                      SizedBox(height: 33.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: _buildItemsHeader(
                          context,
                          headerName: "msg_explore_categories".tr,
                        ),
                      ),
                      SizedBox(height: 26.h),
                      _buildExploreCategoryItemList(context),

                      SizedBox(height: 31.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: _buildItemsHeader(
                          context,
                          headerName: "lbl_trending_ads".tr,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      CustomTabBar(
                        boxDecoration: boxDecoration,
                        tabviewController: tabviewController,
                        tabs: [
                          Tab(
                            child: Text(
                              "lbl_top_listings".tr,
                            ),
                          ),
                          Tab(
                            child: Text(
                              "lbl_trending".tr,
                            ),
                          ),
                          Tab(
                            child: Text(
                              "lbl_latest".tr,
                            ),
                          ),
                        ],
                      ),
                      buildWidgetSpace(height: 10.h),
                      buildTabBarView(context, tabviewController, [
                        //  HomePageProductList.builder(context, getAllPosting), //HomepageTopListingsPage
                        HomePageProductList.builder(
                          context,
                        ), //HomepageTopListingsPage
                        HomePageProductList.builder(
                          context,
                        ),
                        // HomePageProductList.builder(context, latest), //HomepageLatestOnePage
                        HomePageProductList.builder(
                          context,
                        ), //HomepageTopListingsPage
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildShopNowCardWidget(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      margin: EdgeInsets.symmetric(horizontal: 16.adaptSize),
      padding: EdgeInsets.symmetric(
        horizontal: 16.adaptSize,
        vertical: 4.adaptSize,
      ),
      decoration: AppDecoration.outlineOnError.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 132.h,
                  child: Text(
                    "msg_black_friday_sales".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallGilroySemiBoldBluegray50
                        .copyWith(
                            height: 1.33,
                            color: appThemeColors.blueGray900,
                            fontSize: 18.fSize),
                  ),
                ),
                SizedBox(height: 4.v),
                SizedBox(
                  width: 116.h,
                  child: Text(
                    "msg_discover_the_perfect".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallGilroySemiBoldBluegray50
                        .copyWith(
                      height: 1.33,
                      color: appThemeColors.blueGray900,
                      fontSize: 12.fSize,
                    ),
                  ),
                ),
                SizedBox(height: 15.v),
                CustomOutlinedButton(
                  height: 36.h,
                  width: 101.v,
                  text: "lbl_shop_now".tr,
                  buttonStyle: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: appThemeColors.blueGray900,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  buttonTextStyle: appThemeData.textTheme.bodyMedium!,
                  onPressed: () {
                    NavigatorService.pushNamed(AppRoutes.exploreCategory,
                        arguments: {
                          'dataResponse': widget.postingDataResponse,
                          'categoriesResponse':
                              widget.postingByCategoriesResponse
                        });
                  },
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBg51,
            height: 154.v,
            width: 160.h,
            margin: EdgeInsets.only(left: 4.h),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildItemsHeader(
    BuildContext context, {
    required String headerName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: CustomTextStyles.bodyMediumBluegray500.copyWith(
            color: appThemeColors.blueGray800,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgFrameBlueGray800,
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: appThemeColors.blueGray800,
        ),
      ],
    );
  }

  Container _buildExploreCategoryItemList(BuildContext context) {
    final categoriesData = widget.postingByCategoriesResponse.data;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 350.adaptSize,
      width: SizeUtils.width,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns
          crossAxisSpacing: 1.0.adaptSize, // Horizontal spacing between items
          mainAxisSpacing: 1.0.adaptSize, // Vertical spacing between items
        ),
        itemCount: categoriesData?.length, // Total number of items
        itemBuilder: (context, index) {
          final model = categoriesData?[index];
          return (model?.iconUrl != null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomImageView(
                        imagePath: model?.iconUrl,
                        height: 60.adaptSize,
                        width: 60.adaptSize,
                      ),
                    ),
                    // buildWidgetSpace(height: 20),

                    Expanded(child: wrapCategoryText(model!.category!)),

                    Expanded(
                      child: Text(
                        model.count.toString(),
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Gilroy-Medium',
                          fontSize: 12.fSize,
                          color: const Color(0xFF98A2B3),
                        ),
                      ),
                    ),
                  ],
                )
              : CustomImageView(
                  imagePath: ImageConstant.imageNotFound,
                );
        },
      ),
    );
  }

  Widget wrapCategoryText(String category) {
    final parts = category.split('&');
    final spans = <TextSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i].trim(),
        style: TextStyle(
          fontFamily: 'Gilroy-Medium',
          fontSize: 12.fSize,
          color: const Color(0xFF344054),
        ),
      ));

      if (i < parts.length - 1) {
        spans.add(TextSpan(
          text: ' &\n',
          style: TextStyle(
            fontFamily: 'Gilroy-Medium',
            fontSize: 12.fSize,
            color: const Color(0xFF344054),
          ),
        ));
      }
    }

    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      text: TextSpan(children: spans),
    );
  }

  /// Section Widget
}

Widget buildTabBarView(BuildContext context, TabController tabviewController,
    List<Widget> products) {
  return SizedBox(
    height: SizeUtils.height,
    child: TabBarView(
      controller: tabviewController,
      children: products,
    ),
  );
}

/// Section Widget
Widget buildHeader(BuildContext context,
    {required List<PostingDataResponse> postingDataResponse}) {
  return Container(
    padding: EdgeInsets.only(
      bottom: 15.h,
    ),
    decoration: AppDecoration.outlineBlueGray,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(height: 36.v),
        CustomAppBar(
          height: 80.h,
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
              margin: EdgeInsets.only(
                top: 10.v,
                bottom: 3.v,
              )),
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
        SizedBox(height: 8.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Selector<HomePageProvider, TextEditingController?>(
            selector: (
              context,
              provider,
            ) =>
                provider.searchController,
            builder: (context, searchController, child) {
              return Consumer<HomePageProvider>(
                  builder: (context, provider, child) {
                return SearchWidget(
                  postings: postingDataResponse,
                );
              });
            },
          ),
        ),
      ],
    ),
  );
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabviewController,
    required this.tabs,
    this.boxDecoration,
  });

  final TabController tabviewController;
  final List<Tab> tabs;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: SizeUtils.width,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.symmetric(horizontal: 20.v, vertical: 5.h),
        labelColor: appThemeColors.teal900,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Gilroy-Regular',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appThemeColors.blueGray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Gilroy-Regular',
          fontWeight: FontWeight.w400,
          decorationColor: appThemeColors.greenA700,
        ),
        indicator: boxDecoration,
        tabs: tabs,
      ),
    );
  }
}

BoxDecoration boxDecoration = BoxDecoration(
  color: appThemeColors.greenA100,
  borderRadius: BorderRadius.circular(
    8.h,
  ),
  border: Border.all(
    color: appThemeColors.greenA700,
    width: 1.h,
  ),
  boxShadow: [
    BoxShadow(
      color: appThemeData.colorScheme.primary,
      offset: const Offset(
        0,
        1,
      ),
    ),
  ],
);
