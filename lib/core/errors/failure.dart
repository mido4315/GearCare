import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure {
  const Failure(this.errorMessage);

  final String errorMessage;
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return const ServerFailure('Connection Error!');

      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected Error, Please try again!');
      default:
        return const ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      print('response.toString()');
      print(response.toString());
      return ServerFailure(response["message"]);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal Server error, Please try later');
      // return  ServerFailure(response.toString());
    } else {
      return const ServerFailure('Opps There was an Error, Please try again');
    }
  }
}