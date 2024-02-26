import 'network_status.dart';
import 'package:flutter/material.dart';

class NetworkResult<T> {
  final T? data;
  final String? message;
  final int? code;
  final dynamic throwable;
  final Status status;

  NetworkResult(
      {this.data,
      this.message,
      this.code,
      this.throwable,
      required this.status});

  factory NetworkResult.success(T data, {String? message, int? code}) {
    return NetworkResult<T>(
      data: data,
      message: message,
      code: code,
      status: Status.SUCCESS,
    );
  }

  factory NetworkResult.error(String message, {int? code, T? data}) {
    return NetworkResult<T>(
      data: data,
      message: message,
      code: code,
      status: Status.ERROR,
    );
  }

  factory NetworkResult.apiException(dynamic cause, String? message) {
    return NetworkResult<T>(
      throwable: cause,
      message: message,
      status: Status.EXCEPTION,
    );
  }

  factory NetworkResult.loading(T? data) {
    return NetworkResult<T>(
      data: data,
      message: 'loading..',
      status: Status.LOADING,
    );
  }
}

typedef OnSuccess<T> = void Function(T data);
typedef OnError = void Function(String? error);
typedef OnApiException = void Function(String? message);

void liveDataObserver<T>({
  required ValueNotifier<NetworkResult<T>?> liveData,
  required OnSuccess<T> onSuccess,
  OnError? onError,
  OnApiException? onApiException,
}) {
  liveData.addListener(() {
    final result = liveData.value;
    const apiEx =
        "Expected BEGIN_ARRAY but was BEGIN_OBJECT at line 1 column 2 path \$";
    // EasyLoading.show(status: 'loading..');
    switch (result?.status) {
      case Status.LOADING:
        CustomEasyLoading.showLoading(status: 'loading..');
        break;
      case Status.SUCCESS:
        CustomEasyLoading.dismiss();
        if (result!.data != null) {
          onSuccess(result.data as T);
        }
        break;
      case Status.EXCEPTION:
        CustomEasyLoading.dismiss();
        onApiException?.call(result?.throwable?.toString());
        if (result?.throwable?.toString() == apiEx) {
          CustomEasyLoading.showToast('No Data Found');
        }
        break;
      case Status.ERROR:
        CustomEasyLoading.dismiss();
        if (result?.message?.contains(apiEx) == true) {
          CustomEasyLoading.showToast('No Data Found');
          onError?.call('No Data Found');
        } else {
          CustomEasyLoading.showToast(result?.message ?? '');
          onError?.call(result?.message);
        }
        break;
      default:
        break;
    }
  });
}
