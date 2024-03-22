import 'package:dio/dio.dart';
import 'package:trenda/presentation/homepage/models/response_models/get_posting_by_categories.dart';
import 'package:flutter/material.dart';
import '../../../core/http/http_client.dart';
import '../../../core/http/network_status.dart';
import '../../../core/network/network_info.dart';
import '../model/user_post_model.dart';

class UserProvider extends ChangeNotifier {
  HttpAPIDioClient apiDioClient = HttpAPIDioClient();
  GetPostBySlugResponseBody? _allPostingResponseBody;
  List<CategoriesDataModel>? categoriesData;

  String get message => _message;
  String _message = '';

  get searchController => null;

  Future<GetPostBySlugResponseBody?> getUserPostBySlug(
      {required String endpoints, required String? path}) async {
    try {
      final isConnected = await NetworkInfo().isConnected();
      if (isConnected) {
        final request = await HttpAPIDioClient.getAll('$endpoints/$path');
        switch (request.statusCode) {
          case 200:
            debugPrint("::::::::::BODY ${request.data}");
            if (request.data != null) {
              _allPostingResponseBody =
                  GetPostBySlugResponseBody.fromJson(request.data);
            } else {
              CustomEasyLoading.showToast('No data found');
            }
            break;
          default:
            // Handle other status codes
            CustomEasyLoading.dismiss();
            debugPrint("::::::::::BODY ${request.data}");
            _allPostingResponseBody =
                GetPostBySlugResponseBody.fromJson(request.data);
            break;
        }
      } else {
        _message = 'No internet connection';
        CustomEasyLoading.dismiss();
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
              _allPostingResponseBody =
                  GetPostBySlugResponseBody.fromJson(data);
              break;
            case 401:
              // Handle Unauthorized
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetPostBySlugResponseBody.fromJson(data);
              break;
            case 403:
              // Handle Forbidden
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetPostBySlugResponseBody.fromJson(data);
              break;
            case 404:
              // Handle Not Found
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetPostBySlugResponseBody.fromJson(data);
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
    return _allPostingResponseBody;
  }

  void debugPrintResult(String? message, int? statusCode, dynamic data) {
    debugPrint("::::::::::statusCodes $statusCode\n ");
    debugPrint("::::::::::message $message\n ");
    debugPrint("::::::::::DioException $data\n ");
  }
}
