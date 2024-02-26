import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'provider/homepage_provider.dart';

// ignore_for_file: must_be_immutable
class HomepagePage extends StatefulWidget {
  const HomepagePage({super.key});

  @override
  HomepagePageState createState() => HomepagePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: const HomepagePage(),
    );
  }
}

class HomepagePageState extends State<HomepagePage>
    with AutomaticKeepAliveClientMixin<HomepagePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appThemeColors.whiteA70001,
        body: _buildScrollView(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 400),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: buildIconWidget('assets/images/img_trenda_logo_up_1.png',
                size: 100.fSize, color: appThemeColors.greenA700),
          ),
          Text('Welcome to Trenda'),
        ],
      ),
    );
  }
}
