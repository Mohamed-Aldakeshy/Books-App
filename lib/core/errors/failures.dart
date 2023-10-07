import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('There was an error in the connection');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error , please try again later!');
      default:
        return ServerFailure('Opps There was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          'Your request was not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try again later!');
    } else {
      return ServerFailure('Opps There was an error, Please try again');
    }
  }
}
