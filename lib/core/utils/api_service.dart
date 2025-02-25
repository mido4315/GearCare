import 'package:dio/dio.dart';

class APIService {
  APIService(this._dio);

  final String _baseUrl = 'http://gearcare.runasp.net/api/';
  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  final Dio _dio;

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, String>? queryParams,
  }) async {
    Response response = await _dio.get(
      '$_baseUrl$path',
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<List<dynamic>> getList({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response = await _dio.get(
      '$_baseUrl$path',
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    Map<String, dynamic>? headers,
    required String path,
    String? data,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$path',
      options: Options(
        headers: headers ?? _headers,
      ),
      data: data,
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postFormData({
    Map<String, dynamic>? headers,
    required String path,
    FormData? data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$path',
      options: Options(
        headers: headers ??
            {
              'Content-Type': 'multipart/form-data',
            },
      ),
      data: data,
    );

    return response.data;
  }

  Future isValidToken({
    required Map<String, dynamic> headers,
    String? data,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl/isValidToken',
      options: Options(
        headers: headers,
      ),
      data: data,
      queryParameters: queryParams,
    );
    return response;
  }

  Future<Map<String, dynamic>> delete({
    Map<String, dynamic>? headers,
    required String path,
    String? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try{
      Response response = await _dio.delete(
        '$_baseUrl$path',
        options: Options(
          headers: headers ?? _headers,
        ),
        data: data,
        queryParameters: queryParams,
      );
    }catch(e){
      print(e);
    }
    return {};
  }
}