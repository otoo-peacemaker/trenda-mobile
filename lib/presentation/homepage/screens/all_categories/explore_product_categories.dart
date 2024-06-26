import '../../../../core/app_export.dart';
import '../../widgets/build_header.dart';
import '../../widgets/custom_tab_bar.dart';
import '../homepage_screen.dart';
import '../../models/response_models/get_all_posting_response_body.dart';
import '../../models/response_models/get_posting_by_categories.dart';
import '../products_list_screen.dart';

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
  late String? category = '';
  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [];

    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final GetAllPostingResponseBody postingDataResponse = args['dataResponse'];
    final GetPostingByCategoriesResponseBody postingByCategoriesResponse =
        args['categoriesResponse'];
    postingByCategoriesResponse.data?.forEach((element) {
      categories.add(element.category!);
    });

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.bg,
        child: Column(
          children: [
            buildHeader(context,
                color: Colors.white,
                postingDataResponse: postingDataResponse.postingResponseData!,
                onTap: () {
              NavigatorService.goBack();
            }), //header
            SizedBox(height: 24.h),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CustomTabBar(
                      tabviewController: tabviewController,
                      tabs: [
                        Tab(child: Text("All".tr)),
                        Tab(child: Text("lbl_latest".tr)),
                        Tab(child: Text("lbl_top_listings".tr)),
                        Tab(child: Text("lbl_trending".tr)),
                      ],
                    ),
                    buildCategoryHeader(),
                    buildDropdowns(categories),
                    buildTabBarView(context, tabviewController, [
                      ProductListScreen.builder(
                          context), //HomepageTopListingsPage
                      ProductListScreen.builder(
                          context), //HomepageTopListingsPage
                      ProductListScreen.builder(context),
                      ProductListScreen.builder(
                          context), //HomepageLatestOnePage
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

  Widget buildCategoryHeader() {
    return Container(
      margin: EdgeInsets.fromLTRB(10.v, 10.h, 0, 5.adaptSize),
      alignment: Alignment.topLeft,
      child: Text(
        category!,
        style: CustomTextStyles.headerTextStyle,
      ),
    );
  }

  Widget buildDropdowns(List<String> categories) {
    return Padding(
      padding: EdgeInsets.all(10.0.adaptSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildDropdownButton(
                hint: 'Category',
                iconPath: ImageConstant.imgArrowDown,
                categories: categories),
          ),
          buildWidgetSpace(width: 10),
          Expanded(
            child: _buildDropdownButton(
                hint: 'Advanced Filter',
                iconPath: ImageConstant.imgSort,
                categories: categories),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(
      {required String hint,
      required String iconPath,
      required List<String> categories}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appThemeColors.gray10001,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        isExpanded: true,
        icon: CustomImageView(
          imagePath: iconPath,
          color: appThemeColors.black900,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        underline: const SizedBox(),
        hint: Text(
          hint,
          style: CustomTextStyles.bodySmallBlueGray900.copyWith(
            fontSize: 13.fSize,
          ),
        ),
        items: categories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: CustomTextStyles.noticeTextStyle,
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            category = value;
          });
        },
      ),
    );
  }
}
