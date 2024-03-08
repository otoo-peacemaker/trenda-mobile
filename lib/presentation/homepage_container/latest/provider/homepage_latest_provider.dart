import 'package:flutter/material.dart';
import '../models/homepage_latest_model.dart';

/// A provider class for the HomepageLatestPage.
///
/// This provider manages the state of the HomepageLatestPage, including the
/// current homepageLatestModelObj
class HomepageLatestProvider extends ChangeNotifier {
  TextEditingController chipController = TextEditingController();

  TextEditingController chipController1 = TextEditingController();

  TextEditingController chipController2 = TextEditingController();

  HomepageLatestModel homepageLatestModelObj = HomepageLatestModel();

  @override
  void dispose() {
    super.dispose();
    chipController.dispose();
    chipController1.dispose();
    chipController2.dispose();
  }
}
