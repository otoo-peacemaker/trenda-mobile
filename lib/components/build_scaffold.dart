import 'package:trenda/core/app_export.dart';

Scaffold buildScaffold({
  required BuildContext context,
  required String appbarTitle,
  required GlobalKey<FormState> formKey,
  required List<Widget> children,
}) {
  double screenHeight = SizeUtils.height;

  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: CustomAppBar(
      leadingWidth: 33.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftarrowIcon,
        margin: EdgeInsets.only(
          left: 13.h,
          top: 15.v,
          bottom: 12.v,
        ),
        onTap: () {
          NavigatorService.goBack();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: appbarTitle.tr,
      ),
      styleType: Style.bgFill,
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: screenHeight * 0.05, // Adjust this factor as needed
        ),
        child: Form(
          key: formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: screenHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    ),
  );
}
