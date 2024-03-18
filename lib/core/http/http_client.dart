import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'interceptors.dart';

class HttpAPIDioClient {
  static final Dio _dio = Dio();
  final ApiInterceptor _apiInterceptor = ApiInterceptor(_dio);
// Base URL for your API
  static const String baseUrl = 'https://trenda-uat.onrender.com';
  static const String baseUrlProd = 'https://trenda-jit3.onrender.com';
  static const String testUrl1 = 'https://randomuser.me/api/';
  static const String testUrl2 = 'https://api.publicapis.org/entries';

// add interceptors

  HttpAPIDioClient() {
    // _apiInterceptor.addInterceptorsWrapper();
    _apiInterceptor.addLogInterceptor();
  }

/*
   * A Http GET method which Returns future response of generic type T where: T could any class or object by  performing queries
   * @params: path is the endpoints
   * @params: queryParameters is dynamic  queryParameters
  **/
  static Future<Response<T>> getByQuery<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get<T>(
      '$baseUrlProd/$path',
      queryParameters: queryParameters,
    );
  }

/*
   * A Http GET method Returns future response of generic type T where: T could any class, object or String
   * @params: path is the endpoints
  **/
  static Future<Response<T>> getAll<T>(String path) async {
    return _dio.get<T>('$baseUrlProd/$path');
  }

/*
   * A Http POST method Returns future responseBody of generic type T where T could any class, object or String
   * @params: path is the endpoints
   * @params: data : dynamic data request to be sent to the server
  **/
  Future<Response<T>> post<T>(String path, dynamic data) async {
    return _dio.post<T>(
      '$baseUrl/$path',
      data: data,
    );
  }

/*
   * A Http PUT method which Returns future responseBody of generic type T where T could any class, object or String
   * @params: path is the endpoints
   * @params: data : dynamic data request to be sent to the server
  **/
  Future<Response<T>> put<T>(String path, dynamic data) async {
    return _dio.put<T>(
      '$baseUrl/$path',
      data: data,
    );
  }

// Function to upload multiple files
  Future<void> uploadFiles(List<String> filePaths) async {
    FormData formData = FormData();

    // Add each file to the FormData object
    for (int i = 0; i < filePaths.length; i++) {
      String filePath = filePaths[i];
      String fileName = filePath.split('/').last;
      formData.files.add(MapEntry(
        'files[]',
        await MultipartFile.fromFile(filePath, filename: fileName),
      ));
    }

    try {
      Response response = await _dio.post('$baseUrl/upload', data: formData);
      debugPrint('Upload response: ${response.data}');
    } catch (e) {
      debugPrint('Error uploading files: $e');
    }
  }

/*
   * A Http GET method for downloading a file
   * @params: fileUrl is the URL of the file to be downloaded
   * @params: savePath is the destination path where the file will be saved
   */
  Future<void> downloadFile(String fileUrl, String savePath) async {
    try {
      await _dio.download(
        fileUrl,
        savePath,
        onReceiveProgress: (receivedBytes, totalBytes) {
          // You can implement a progress indicator here if needed
          debugPrint('Received: $receivedBytes out of $totalBytes');
        },
      );
      debugPrint('File downloaded to: $savePath');
    } catch (e) {
      // Handle errors
      debugPrint('Error downloading file: $e');
    }
  }

/*
   * A Http DELETE method which Returns future responseBody of generic type T where T could any class, object or String
   * @params: path is the endpoints
  **/
  Future<Response<T>> delete<T>(String path) async {
    return _dio.delete<T>(
      '$baseUrl/$path',
    );
  }

/*
   * A Http GET method which Returns future response of generic type T where: T could any class or object by  performing queries
   * @params: path is the endpoints
   * @params: queryParameters is dynamic  queryParameters
  **/
  Future<Response<T>> testEndPoint<T>() async {
    return _dio.get<T>(
      testUrl1,
    );
  }
}
