import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import '../../widgets/bottom_bar/bottom_bar_enum.dart';
import '../../widgets/bottom_bar/custom_bottom_bar.dart';
import 'home_page/homepage.dart';
import 'provider/homepage_provider.dart';

// ignore_for_file: must_be_immutable
class HomepagePageContainer extends StatefulWidget {
  const HomepagePageContainer({super.key});

  @override
  _HomepageContainerState createState() => _HomepageContainerState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: const HomepagePageContainer(),
    );
  }
}

class _HomepageContainerState extends State<HomepagePageContainer> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homepage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return AppRoutes.homepage;
      case BottomBarEnum.dashboard:
        return "/";

      case BottomBarEnum.post:
        return "/";
      case BottomBarEnum.messages:
        return "/";
      case BottomBarEnum.profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homepage:
        return HomePage.builder(context);
      default:
        return const DefaultWidget();
    }
  }
}
