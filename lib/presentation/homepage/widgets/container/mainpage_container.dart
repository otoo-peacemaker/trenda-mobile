import 'package:trenda/core/app_export.dart';
import '../../homepage.dart';
import '../../models/response_models/get_all_posting_response_body.dart';
import '../../models/response_models/get_posting_by_categories.dart';

// ignore_for_file: must_be_immutable
class HomepagePageContainer extends StatefulWidget {
  const HomepagePageContainer({super.key});

  @override
  HomepageContainerState createState() => HomepageContainerState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const HomepagePageContainer(),
    );
  }
}

class HomepageContainerState extends State<HomepagePageContainer> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final GetAllPostingResponseBody postingDataResponse = args['dataResponse'];
    final GetPostingByCategoriesResponseBody postingByCategoriesResponse =
        args['categoriesResponse'];

    // final GetAllPostingResponseBody item = ModalRoute.of(context)?.settings.arguments as GetAllPostingResponseBody;

    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homepage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(
                context,
                routeSetting.name!,
                postingDataResponse,
                postingByCategoriesResponse),
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
      GetAllPostingResponseBody posting,
      GetPostingByCategoriesResponseBody postingByCategories) {
    switch (currentRoute) {
      case AppRoutes.homepage:
        return HomePage.builder(context, posting, postingByCategories);
      default:
        return const DefaultWidget();
    }
  }
}
