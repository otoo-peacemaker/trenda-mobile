import 'package:dio/dio.dart';
import 'package:trenda/core/app_export.dart';

class ApiInterceptor {
  Dio dio;

  ApiInterceptor(this.dio) {
    // Add configuration method here
    // configureDio();
  }

  // Configuration
  void configureDio() {}
  // Add interceptors wrapper
  void addInterceptorsWrapper() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Fetch headers from the server
          final Map<String, dynamic> headers = await getHeaders();
          // Add headers to the request
          options.headers.addAll(headers);
          return handler.next(options);
        },
        onResponse: (options, handler) async {
          // Handle response
          handleResponse(options);
        },
        onError: (options, handler) async {
          // Handle error
          handleError(options);
        },
      ),
    );
  }

  // Add log interceptor
  void addLogInterceptor() {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (o) => Logger.log(o),
    ));
  }

  // Get headers method (to be implemented)
  Future<Map<String, dynamic>> getHeaders() async {
    // Retrieve access token from storage
    final String? accessToken = await PrefUtils.getAccessToken();
    // Implement your logic to refresh token if needed
    return {'Authorization': 'Bearer $accessToken'};
  }

  Future<void> refreshToken() async {
    // Implement your logic to refresh token and save the new token to storage
    const String newToken =
        'NEW_ACCESS_TOKEN'; // Replace with your actual logic
    await PrefUtils.saveAccessToken(newToken);
  }

  // Handle response
  void handleResponse(Response<dynamic> response) {
    // Handle response logic
    debugPrint("Handling response: ${response.data}");
  }

  // Handle error
  void handleError(DioException error) {
    // Handle error logic
    debugPrint("Handling Trenda Api error: $error");
    // You can implement logic to refresh token here if needed
  }
}
