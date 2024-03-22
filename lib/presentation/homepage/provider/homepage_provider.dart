import 'package:dio/dio.dart';
import 'package:trenda/presentation/homepage/models/response_models/get_posting_by_categories.dart';
import 'package:flutter/material.dart';

import '../../../core/http/http_client.dart';
import '../../../core/http/network_status.dart';
import '../../../core/network/network_info.dart';
import '../../user/model/user_post_model.dart';
import '../models/response_models/get_all_posting_response_body.dart';
import '../endpoints.dart' as endpoints;

class HomePageProvider extends ChangeNotifier {
  HttpAPIDioClient apiDioClient = HttpAPIDioClient();
  GetPostingByCategoriesResponseBody? _postingByCategoriesResponseBody;
  GetAllPostingResponseBody? _allPostingResponseBody;
  List<CategoriesDataModel>? categoriesData;
  GetPostBySlugResponseBody? _getPostBySlugResponseBody;

  TextEditingController chipController = TextEditingController();
  TextEditingController chipController1 = TextEditingController();
  TextEditingController chipController2 = TextEditingController();

  String get message => _message;
  String _message = '';

  get searchController => null;

  Future<GetPostingByCategoriesResponseBody?> getPostingByCategories() async {
    try {
      final isConnected = await NetworkInfo().isConnected();
      if (isConnected) {
        final request =
            await HttpAPIDioClient.getAll(endpoints.getAllByCategories);
        switch (request.statusCode) {
          case 200:
            if (request.data != null) {
              _postingByCategoriesResponseBody =
                  GetPostingByCategoriesResponseBody.fromJson(request.data);
            } else {
              CustomEasyLoading.showToast('No data found');
            }

            break;
          default:
            // Handle other status codes
            CustomEasyLoading.dismiss();
            _postingByCategoriesResponseBody =
                GetPostingByCategoriesResponseBody.fromJson(request.data);
            break;
        }
      } else {
        _message = 'No internet connection';
        CustomEasyLoading.dismiss();
        CustomEasyLoading.showToast(_message);
        notifyListeners();
      }
    } catch (err) {
      CustomEasyLoading.dismiss();
      // ProgressDialogUtils.hideProgressDialog();
      if (err is DioException) {
        if (err.response != null) {
          debugPrintResult(
            err.response?.statusMessage,
            err.response?.statusCode,
            err.response?.data,
          );
          _postingByCategoriesResponseBody =
              GetPostingByCategoriesResponseBody.fromJson(err.response?.data);
          categoriesData = _postingByCategoriesResponseBody?.data;
        } else {
          debugPrint("DioError without response: $err");
        }
      } else {
        // Handle other errors
        debugPrint("Error: $err");
      }
    }
    return _postingByCategoriesResponseBody;
  }

  Future<GetAllPostingResponseBody?> getPostingsByATTL(
      {required String endpoints, Map<String, dynamic>? queries}) async {
    try {
      final isConnected = await NetworkInfo().isConnected();
      if (isConnected) {
        // ProgressDialogUtils.showProgressDialog();
        final request = await HttpAPIDioClient.getByQuery(endpoints,
            queryParameters: queries);
        switch (request.statusCode) {
          case 200:
            debugPrint("::::::::::BODY ${request.data}");
            if (request.data != null) {
              _allPostingResponseBody =
                  GetAllPostingResponseBody.fromJson(request.data);
            } else {
              CustomEasyLoading.showToast('No data found');
            }
            break;
          default:
            // Handle other status codes
            CustomEasyLoading.dismiss();
            debugPrint("::::::::::BODY ${request.data}");
            _allPostingResponseBody =
                GetAllPostingResponseBody.fromJson(request.data);
            break;
        }
      } else {
        _message = 'No internet connection';
        CustomEasyLoading.dismiss();
        notifyListeners();
      }
    } catch (err) {
      CustomEasyLoading.dismiss();
      // ProgressDialogUtils.hideProgressDialog();
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
                  GetAllPostingResponseBody.fromJson(data);
              break;
            case 401:
              // Handle Unauthorized
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetAllPostingResponseBody.fromJson(data);
              break;
            case 403:
              // Handle Forbidden
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetAllPostingResponseBody.fromJson(data);
              break;
            case 404:
              // Handle Not Found
              debugPrintResult(message, statusCodes, data);
              _allPostingResponseBody =
                  GetAllPostingResponseBody.fromJson(data);
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
              _getPostBySlugResponseBody =
                  GetPostBySlugResponseBody.fromJson(request.data);
            } else {
              CustomEasyLoading.showToast('No data found');
            }
            break;
          default:
            // Handle other status codes
            CustomEasyLoading.dismiss();
            debugPrint("::::::::::BODY ${request.data}");
            _getPostBySlugResponseBody =
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
    return _getPostBySlugResponseBody;
  }

  //TODO: enum { posting, categories, slug }
  void debugPrintResult(String? message, int? statusCode, dynamic data) {
    debugPrint("::::::::::statusCodes $statusCode\n ");
    debugPrint("::::::::::message $message\n ");
    debugPrint("::::::::::DioException $data\n ");
    _getPostBySlugResponseBody = GetPostBySlugResponseBody.fromJson(data);
  }

  @override
  void dispose() {
    super.dispose();
    chipController.dispose();
    chipController1.dispose();
    chipController2.dispose();
  }
}

enum ResponseType { posting, categories, slug }
