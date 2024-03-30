import '../../../core/app_export.dart';

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
      height: 35.v,
      width: SizeUtils.width,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.symmetric(
          horizontal: 5.h,
        ),
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

BoxDecoration boxDecoration = BoxDecoration(
  color: appThemeColors.greenA100,
  borderRadius: BorderRadius.circular(
    8.adaptSize,
  ),
  border: Border.all(
    color: appThemeColors.greenA700,
    width: 1.adaptSize,
    strokeAlign: BorderSide.strokeAlignOutside,
  ),
);
