import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trenda/core/app_export.dart';
import 'bottom_bar_enum.dart';
import 'bottom_bar_menu_model.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavDashboard,
      activeIcon: ImageConstant.imgNavDashboard,
      title: "lbl_dashboard".tr,
      type: BottomBarEnum.dashboard,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgClose,
      activeIcon: ImageConstant.imgClose,
      title: "lbl_messages".tr,
      type: BottomBarEnum.post,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMessages,
      activeIcon: ImageConstant.imgNavMessages,
      title: "lbl_messages".tr,
      type: BottomBarEnum.messages,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFrame,
      activeIcon: ImageConstant.imgFrame,
      title: "Menu".tr,
      type: BottomBarEnum.profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.v,
      decoration: BoxDecoration(
        color: appThemeColors.whiteA70001,
        border: Border(
          top: BorderSide(
            color: appThemeColors.blueGray50,
            width: 1.h,
          ),
        ),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: List.generate(bottomMenuList.length, (index) {
          if (bottomMenuList[index].isCircle) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageConstant.imgClose,
                height: 48.adaptSize,
                width: 48.adaptSize,
              ),
              label: '',
            );
          }
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appThemeColors.blueGray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodyMediumBluegray500.copyWith(
                      color: appThemeColors.blueGray500,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appThemeData.colorScheme.errorContainer,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodyMediumErrorContainer.copyWith(
                      color: appThemeData.colorScheme.errorContainer,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New widget under implementation',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
