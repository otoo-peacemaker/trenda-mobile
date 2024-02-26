import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'provider/request_new_code_provider.dart';

class RequestNewCodeScreen extends StatefulWidget {
  const RequestNewCodeScreen({super.key});

  @override
  RequestNewCodeScreenState createState() => RequestNewCodeScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestNewCodeProvider(),
      child: const RequestNewCodeScreen(),
    );
  }
}

class RequestNewCodeScreenState extends State<RequestNewCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildScaffold(
        context: context,
        appbarTitle: "msg_request_new_code",
        formKey: _formKey,
        children: [],
      ),
    );
  }
}
