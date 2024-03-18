import '../../../../core/app_export.dart';
import '../../homepage.dart';
import '../homepage_product_list.dart';

class ExploreProductCategory extends StatefulWidget {
  const ExploreProductCategory({super.key});

  @override
  State<ExploreProductCategory> createState() => _ExploreProductCategoryState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const ExploreProductCategory(),
    );
  }
}

class _ExploreProductCategoryState extends State<ExploreProductCategory>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownList = [
      'Option 1',
      'Option 1',
      'Option 1',
      'Option 1'
    ];
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.bg,
        child: Column(
          children: [
            buildHeader(context), //header
            SizedBox(height: 24.h),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CustomTabBar(
                      tabviewController: tabviewController,
                      tabs: [
                        Tab(
                          child: Text(
                            "All".tr,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "lbl_latest".tr,
                          ),
                        ),
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
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.v, vertical: 10.h),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Fashion',
                        style: CustomTextStyles.headerTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.adaptSize),
                          child: Container(
                            decoration: BoxDecoration(
                                color: appThemeColors.gray10001,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              icon: CustomImageView(
                                imagePath: ImageConstant.imgArrowDown,
                                color: appThemeColors.black900,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hint: Text(
                                'Category',
                                style: CustomTextStyles.bodySmallBlueGray900
                                    .copyWith(fontSize: 11.fSize),
                              ),
                              items: dropdownList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.adaptSize),
                          child: Container(
                            decoration: BoxDecoration(
                                color: appThemeColors.gray10001,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              icon: CustomImageView(
                                imagePath: ImageConstant.imgSort,
                                color: appThemeColors.black900,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              underline: const SizedBox(),
                              hint: Text(
                                'Advanced Filter',
                                style: CustomTextStyles.bodySmallBlueGray900
                                    .copyWith(fontSize: 11.fSize),
                              ),
                              items: dropdownList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    buildWidgetSpace(height: 10.h),
                    buildTabBarView(context, tabviewController, [
                      HomePageProductList.builder(
                        context,
                      ), //HomepageTopListingsPage
                      HomePageProductList.builder(
                        context,
                      ), //HomepageTopListingsPage
                      HomePageProductList.builder(
                        context,
                      ),
                      HomePageProductList.builder(
                        context,
                      ), //HomepageLatestOnePage
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
