import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/custom_elevated_button.dart';
import 'models/sell_or_buy_model.dart';
import 'provider/sell_or_buy_provider.dart';

class SellOrBuyScreen extends StatefulWidget {
  const SellOrBuyScreen({super.key});

  @override
  SellOrBuyScreenState createState() => SellOrBuyScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SellOrBuyProvider(),
      child: const SellOrBuyScreen(),
    );
  }
}

class SellOrBuyScreenState extends State<SellOrBuyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text(
                "msg_what_do_you_want".tr,
                style: CustomTextStyles.bodyMediumGilroyRegularGreenA700,
              ),
              SizedBox(height: 34.v),
              CustomElevatedButton(
                text: "lbl_sell".tr,
              ),
              SizedBox(height: 16.v),
              CustomElevatedButton(
                text: "lbl_buy".tr,
                buttonStyle: CustomButtonStyles.outlineGreenATL8,
                buttonTextStyle: CustomTextStyles.bodyMediumOnPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
