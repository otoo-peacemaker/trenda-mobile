import 'package:country_pickers/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import '../models/auth/request_model.dart';
import '../models/auth/response_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  HttpAPIDioClient apiDioClient = HttpAPIDioClient();
  AuthenticationResponseBody? _authResponse;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool rememberMe = false;
  bool acceptTerms = false;
  Country? selectedCountry;

  String get message => _message;
  String _message = '';

  Future<AuthenticationResponseBody?> authenticateUser({
    required String endpoints,
    required AuthenticationRequestBody authRequestBody,
  }) async {
    try {
      final isConnected = await NetworkInfo().isConnected();
      if (isConnected) {
        CustomEasyLoading.showLoading();
        // ProgressDialogUtils.showProgressDialog();
        final request =
            await apiDioClient.post(endpoints, authRequestBody.toJson());
        switch (request.statusCode) {
          case 200:
            CustomEasyLoading.dismiss();
            debugPrint("::::::::::BODY ${request.data}");
            _authResponse = AuthenticationResponseBody.fromJson(request.data);
            break;
          default:
            // Handle other status codes
            break;
        }
      } else {
        _message = 'No internet connection';
        debugPrint(message);
        notifyListeners();
      }
    } catch (err) {
      CustomEasyLoading.dismiss();
      // ProgressDialogUtils.hideProgressDialog();
      if (err is DioException) {
        if (err.response != null) {
          debugPrint(
              "::::::::::DioException ${err.response?.statusCode.toString()}\n ");
          debugPrint(
              "::::::::::DioException ${err.response?.statusMessage.toString()}\n ");
          debugPrint("::::::::::DioException ${err.response?.data}\n ");
          _authResponse =
              AuthenticationResponseBody.fromJson(err.response?.data);
        } else {
          debugPrint("DioError without response: $err");
        }
      } else {
        // Handle other errors
        debugPrint("Error: $err");
      }
    }
    return _authResponse;
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    _message = '';
  }

  void changeCheckBox1(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void changeCheckBox2(bool value) {
    acceptTerms = value;
    notifyListeners();
  }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }
}

/*
*  val awaitResult = repository.authenticateUser(endpoint: endpoint, requestBody: requestBody);
*  static const apiEx =
      "Expected BEGIN_ARRAY but was BEGIN_OBJECT at line 1 column 2 path \$";
* */
