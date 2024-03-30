import 'package:trenda/presentation/homepage/widgets/search_widget.dart';

import '../../../core/app_export.dart';
import '../models/response_models/get_all_posting_response_body.dart';

/// Section Widget
Widget buildHeader(
  BuildContext context, {
  String? leading = 'assets/images/img_leftarrow_icon.svg',
  required List<PostingDataResponse> postingDataResponse,
  Function? onTap,
  Color? color,
}) {
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
            imagePath: leading,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 3.v,
              bottom: 3.v,
            ),
            onTap: onTap,
            color: const Color(0xFFffffff),
          ),
          centerTitle: true,
          title: AppbarTitleImage(
            imagePath: ImageConstant.imgTrendaLogoUp2,
            margin: EdgeInsets.only(
              top: 10.v,
              bottom: 3.v,
            ),
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
