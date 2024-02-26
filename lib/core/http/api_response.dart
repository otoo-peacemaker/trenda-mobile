import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'network_result.dart';

abstract class BaseApiResponse {
  Future<NetworkResult<T>> safeApiCall<T>(
      Future<Response<T>> Function() apiCall) async {
    NetworkResult.loading(null);
    try {
      var response = await apiCall();
      var body = response.data;
      var message = response.statusMessage;
      if (response.statusCode == 200 && body != null) {
        return NetworkResult.success(body,
            message: message, code: response.statusCode);
      } else {
        return error(
            code: response.statusCode, errorMessage: response.statusMessage);
      }
    } on DioException catch (e) {
      return error(code: e.response?.statusCode, errorMessage: e.message);
    } on SocketException catch (e) {
      return exceptions(e.message, e);
    } on HttpException catch (e) {
      return error(errorMessage: e.message);
    } on FormatException catch (e) {
      return error(code: -1, errorMessage: e.message);
    } catch (e) {
      return NetworkResult.apiException(e, e.toString());
    }
  }

  NetworkResult<T> error<T>({int? code, String? errorMessage, T? errBody}) {
    return NetworkResult.error("$errorMessage", code: code, data: errBody);
  }

  NetworkResult<T> exceptions<T>(String? message, dynamic cause) {
    return NetworkResult.apiException(cause, message);
  }
}
