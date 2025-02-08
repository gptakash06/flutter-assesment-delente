
import 'package:dio/dio.dart' as dio;

import 'package:flutter_assessment/app/utils/helpers/snackbar_helper.dart';

class ApiHelper {
  final String apiKey = "8QHTQJRQ930RQ4GT"; // Your API Key
  final String baseUrl = "https://www.alphavantage.co/query";

  final dio.Dio _dio = dio.Dio(
    dio.BaseOptions(
      baseUrl: "https://www.alphavantage.co/query",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  ApiHelper() {
    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (dio.DioException e, handler) {
          print('Error: ${e.message}');
          SnackbarHelper.showError('Request failed: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<dynamic> get(String function, {String symbol = "", Map<String, String>? extraParams}) async {
    try {
      Map<String, String> queryParams = {
        'function': function,
        'apikey': apiKey,
      };

      if (symbol.isNotEmpty) {
        queryParams['symbol'] = symbol;
      }
      if (extraParams != null) {
        queryParams.addAll(extraParams);
      }

      final response = await _dio.get('', queryParameters: queryParams);
      print("API Response: ${response.data}");
      return _handleResponse(response);
    } catch (e) {
      print('Error: $e');
      SnackbarHelper.showError('Failed to fetch data');
      return null;
    }
  }

  dynamic _handleResponse(dio.Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      SnackbarHelper.showError('Failed to load data');
      return null;
    }
  }
}