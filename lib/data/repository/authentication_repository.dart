import 'package:dio/dio.dart';
import 'package:trenda/core/app_export.dart';
import '../../presentation/authentication/models/auth/request_model.dart';
import '../../presentation/authentication/models/auth/response_model.dart';

class AuthenticationRepository extends BaseApiResponse {
  HttpAPIDioClient apiDioClient = HttpAPIDioClient();

  Future<NetworkResult<AuthenticationResponseBody>> registerUser(
      AuthenticationRequestBody registerUser) async {
    return await safeApiCall(() => apiDioClient
        .post<AuthenticationResponseBody>(register, registerUser.toJson()));
  }

  Future<Response<AuthenticationResponseBody>> authenticateUser({
    required String endpoint,
    required AuthenticationRequestBody requestBody,
  }) async {
    return await apiDioClient.post<AuthenticationResponseBody>(
        endpoint, requestBody.toJson());
  }

  Future<Response> test() async {
    return await apiDioClient.testEndPoint();
  }
}
