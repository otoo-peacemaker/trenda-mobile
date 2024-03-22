import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:dio/dio.dart';
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

      if (err is DioException) {
        if (err.response != null) {
          final statusCodes = err.response?.statusCode;
          final data = err.response?.data;
          final message = err.response?.statusMessage;
          switch (statusCodes) {
            case 400:
              // Handle Bad Request
              debugPrintResult(message, statusCodes, data);
              break;
            case 401:
              // Handle Unauthorized
              debugPrintResult(message, statusCodes, data);
              break;
            case 403:
              // Handle Forbidden
              debugPrintResult(message, statusCodes, data);
              break;
            case 404:
              // Handle Not Found
              debugPrintResult(message, statusCodes, data);
              break;
            // Add more cases as needed
            default:
              // Handle other status codes
              break;
          }
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

  void debugPrintResult(String? message, int? statusCode, dynamic data) {
    debugPrint("::::::::::statusCodes $statusCode\n ");
    debugPrint("::::::::::message $message\n ");
    debugPrint("::::::::::DioExceptionData $data\n ");
    _authResponse = AuthenticationResponseBody.fromJson(data);
    debugPrint(
        "::::::::::DioException_authResponse ${_authResponse?.error}\n ");
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
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
