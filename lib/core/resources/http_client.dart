import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:logger/logger.dart';

class HttpClient {
  final Dio _dio;
  final box = GetStorage();

  HttpClient()
      : _dio = Dio(BaseOptions(validateStatus: (status) {
          return status != null && status < 600;
        })) {
    // Dio interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra['requiresToken'] == true) {
            options.headers['Authorization'] = 'Bearer ${getJwtToken()}';
          }
          // if (options.extra['deviceInfo'] == true) {
          //   options.queryParameters['device'] = await getDevicesInfo();
          // }
          options.headers['Accept'] = 'application/json';
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  /// Get
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// POST
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } on DioException catch (e) {
      // Capturer l'exception DioException
      Logger().e('DioException occurred: ${e.message}');
      // Vérifiez le code d'état de l'erreur pour des actions spécifiques
      if (e.response != null) {
        Logger().e('Response data: ${e.response?.data}');
        Logger().e('Status code: ${e.response?.statusCode}');
      } else {
        // Cas d'erreur où il n'y a pas de réponse (par exemple, pas de connexion réseau)
        Logger().e('Error: ${e.message}');
      }
      if (e.response != null && e.response?.statusCode == 500) {
        return Response(
          statusMessage: "erreur ${e.response?.data}",
          requestOptions: RequestOptions(data: null),
        );
      }
      return Response(
        statusMessage: "erreur ${e.message}",
        requestOptions: RequestOptions(data: null),
      );
    }
  }

  Future<Response> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) async {
    return await _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }

  /// Get token
  String getJwtToken() {
    return StorageService().authToken;
  }

  /// Get device info
  Future<Map<String, String>> getDevicesInfo() async {
    try {
      final devicesInfoPlugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final androidInfo = await devicesInfoPlugin.androidInfo;
        return {
          "model": androidInfo.model + androidInfo.brand,
          "osVersion": androidInfo.version.release,
          "device": androidInfo.device,
          "manufacturer": androidInfo.manufacturer,
          "product": androidInfo.product,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await devicesInfoPlugin.iosInfo;
        return {
          "model": iosInfo.model + iosInfo.utsname.machine,
          "osVersion": iosInfo.systemVersion,
          "name": iosInfo.name,
          "systemeName": iosInfo.systemName,
        };
      }
      return {};
    } on PlatformException catch (e) {
      throw PlatformException(code: "200", message: e.toString());
    }
  }
}
