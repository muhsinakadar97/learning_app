import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:learningapp/src/config/network/failure.dart';
import 'package:learningapp/src/core/urls.dart';
import 'package:learningapp/src/data/models/todo.dart';
import 'package:learningapp/src/data/services/data_access/api_service.dart';

import '../../../config/network/error_handler.dart';
import '../../../domain/repositories/todo_repo/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  ApiService apiService = ApiService();
  @override
  Future<Either<Failure, List<TodoModel>>> fetchTodos() async {
    try {
      final Response response = await apiService.get(
        url: LearningAppUrl.TODO_URL,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<TodoModel> todos = data.map((e) => TodoModel.fromJson(e)).toList();
        return Right(todos);
      } else {
        // Handle non-200 status codes
        final String message = _getErrorMessage(response.statusCode);
        final failure = Failure(message: message, code: response.statusCode);

        // Log the error code and message
        log("Error - Code: ${response.statusCode}, Message: $message");

        return Left(failure);
      }
    } catch (e) {
      String message = ResponseMessage.DEFAULT;
      int code = ResponseCode.DEFAULT;

      // Handle specific exceptions based on the error
      if (e is ClientException) {
        message = "Client Exception: ${e.message}";
        code = ResponseCode
            .BAD_REQUEST; // Use a default error code or customize as needed
        log("ClientException occurred");
        log(message);
      } else if (e is SocketException) {
        message = "Network error: ${e.message}";
        code = ResponseCode.SERVICE_UNAVAILABLE; // For network issues
        log("SocketException occurred");
        log(message);
      } else if (e is TimeoutException) {
        message = "Request Timeout";
        code = ResponseCode.REQUEST_TIMEOUT;
        log("TimeoutException occurred");
        log(message);
      } else if (e is FormatException) {
        message = "Format Exception: Invalid data format";
        code = ResponseCode.BAD_REQUEST; // For incorrect format
        log("FormatException occurred");
        log(message);
      } else if (e is TypeError) {
        message = "TypeError: ${e.toString()}";
        code = ResponseCode.INTERNAL_SERVER_ERROR;
        log("TypeError occurred");
        log(message);
      } else {
        // If an unknown error occurs, default to the generic message
        message = ResponseMessage.DEFAULT;
        code = ResponseCode.DEFAULT;
        log("Unknown error occurred");
        log(message);
      }

      return Left(Failure(message: message, code: code));
    }
  }

// Helper method to get error message based on status code
  String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case ResponseCode.BAD_REQUEST:
        return ResponseMessage.BAD_REQUEST;
      case ResponseCode.UNAUTHORIZED:
        return ResponseMessage.UNAUTHORISED;
      case ResponseCode.NOT_FOUND:
        return ResponseMessage.NOT_FOUND;
      case ResponseCode.REQUEST_TIMEOUT:
        return ResponseMessage.REQUEST_TIMEOUT;
      case ResponseCode.INTERNAL_SERVER_ERROR:
        return ResponseMessage.INTERNAL_SERVER_ERROR;
      case ResponseCode.BAD_GATEWAY:
        return ResponseMessage.BAD_GATEWAY;
      case ResponseCode.GATEWAY_TIMEOUT:
        return ResponseMessage.GATEWAY_TIMEOUT;
      case ResponseCode.HTTP_VERSION_NOT_SUPPORTED:
        return ResponseMessage.HTTP_VERSION_NOT_SUPPORTED;
      case ResponseCode.INSUFFICIENT_STORAGE:
        return ResponseMessage.INSUFFICIENT_STORAGE;
      case ResponseCode.LOOP_DETECTED:
        return ResponseMessage.LOOP_DETECTED;
      case ResponseCode.TOO_MANY_REQUESTS:
        return ResponseMessage.TOO_MANY_REQUESTS;
      case ResponseCode.SERVICE_UNAVAILABLE:
        return ResponseMessage.SERVICE_UNAVAILABLE;
      case ResponseCode.NOT_IMPLEMENTED:
        return ResponseMessage.NOT_IMPLEMENTED;
      case ResponseCode.INCORRECT_API_KEY_PROVIDED:
        return ResponseMessage.INCORRECT_API_KEY_PROVIDED;
      case ResponseCode.NOT_AUTHORIZED_MEMBER_TO_USE_API:
        return ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API;
      case ResponseCode.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED:
        return ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED;
      case ResponseCode.DATA_LIMIT_REACHED_FOR_REQUESTS:
        return ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS;
      case ResponseCode.ENGINE_OVERLOAD:
        return ResponseMessage.ENGINE_OVERLOAD;
      case ResponseCode.NO_CONTENT:
        return ResponseMessage.NO_CONTENT;
      case ResponseCode.FORBIDDEN:
        return ResponseMessage.FORBIDDEN;
      default:
        return ResponseMessage.DEFAULT;
    }
  }

  // @override
  // Future<Either<Failure, List<TodoModel>>> fetchTodos() async {
  //   try {
  //     final Response response = await apiService.get(
  //       url: LearningAppUrl.TODO_URL,
  //     );

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = jsonDecode(response.body);

  //       List<TodoModel> todos = data.map((e) => TodoModel.fromJson(e)).toList();

  //       return Right(todos);
  //     } else {
  //       final String message;
  //       switch (response.statusCode) {
  //         case ResponseCode.BAD_REQUEST:
  //           message = ResponseMessage.BAD_REQUEST;
  //           break;
  //         case ResponseCode.UNAUTHORIZED:
  //           message = ResponseMessage.UNAUTHORISED;
  //           break;
  //         case ResponseCode.NOT_FOUND:
  //           message = ResponseMessage.NOT_FOUND;
  //           break;
  //         case ResponseCode.REQUEST_TIMEOUT:
  //           message = ResponseMessage.REQUEST_TIMEOUT;
  //           break;
  //         case ResponseCode.INTERNAL_SERVER_ERROR:
  //           message = ResponseMessage.INTERNAL_SERVER_ERROR;
  //           break;
  //         case ResponseCode.BAD_GATEWAY:
  //           message = ResponseMessage.BAD_GATEWAY;
  //           break;
  //         case ResponseCode.GATEWAY_TIMEOUT:
  //           message = ResponseMessage.GATEWAY_TIMEOUT;
  //           break;
  //         case ResponseCode.HTTP_VERSION_NOT_SUPPORTED:
  //           message = ResponseMessage.HTTP_VERSION_NOT_SUPPORTED;
  //           break;
  //         case ResponseCode.INSUFFICIENT_STORAGE:
  //           message = ResponseMessage.INSUFFICIENT_STORAGE;
  //           break;
  //         case ResponseCode.LOOP_DETECTED:
  //           message = ResponseMessage.LOOP_DETECTED;
  //           break;
  //         case ResponseCode.TOO_MANY_REQUESTS:
  //           message = ResponseMessage.TOO_MANY_REQUESTS;
  //           break;
  //         case ResponseCode.SERVICE_UNAVAILABLE:
  //           message = ResponseMessage.SERVICE_UNAVAILABLE;
  //           break;
  //         case ResponseCode.NOT_IMPLEMENTED:
  //           message = ResponseMessage.NOT_IMPLEMENTED;
  //           break;
  //         case ResponseCode.INCORRECT_API_KEY_PROVIDED:
  //           message = ResponseMessage.INCORRECT_API_KEY_PROVIDED;
  //           break;
  //         case ResponseCode.NOT_AUTHORIZED_MEMBER_TO_USE_API:
  //           message = ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API;
  //           break;
  //         case ResponseCode.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED:
  //           message = ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED;
  //           break;
  //         case ResponseCode.DATA_LIMIT_REACHED_FOR_REQUESTS:
  //           message = ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS;
  //           break;
  //         case ResponseCode.ENGINE_OVERLOAD:
  //           message = ResponseMessage.ENGINE_OVERLOAD;
  //           break;
  //         case ResponseCode.NO_CONTENT:
  //           message = ResponseMessage.NO_CONTENT;
  //           break;
  //         case ResponseCode.FORBIDDEN:
  //           message = ResponseMessage.FORBIDDEN;
  //           break;
  //         default:
  //           message = ResponseMessage.DEFAULT;
  //       }
  //       Failure failure = Failure(message: message, code: response.statusCode);
  //       return left(failure);
  //     }
  //   } catch (e) {
  //     String message = "";
  //     if (e == ApiStatus.BAD_REQUEST) {
  //       log("${ResponseMessage.BAD_REQUEST} : $e");
  //       message = ResponseMessage.BAD_REQUEST;
  //     } else if (e == ApiStatus.UNAUTHORIZED) {
  //       log("${ResponseMessage.UNAUTHORISED} : $e");
  //       message = ResponseMessage.UNAUTHORISED;
  //     } else if (e == ApiStatus.NOT_FOUND) {
  //       log("${ResponseMessage.NOT_FOUND} : $e");
  //       message = ResponseMessage.NOT_FOUND;
  //     } else if (e == ApiStatus.REQUEST_TIMEOUT) {
  //       log("${ResponseMessage.REQUEST_TIMEOUT} : $e");
  //       message = ResponseMessage.REQUEST_TIMEOUT;
  //     } else if (e == ApiStatus.INTERNAL_SERVER_ERROR) {
  //       log("${ResponseMessage.INTERNAL_SERVER_ERROR} : $e");
  //       message = ResponseMessage.INTERNAL_SERVER_ERROR;
  //     } else if (e == ApiStatus.BAD_GATEWAY) {
  //       log("${ResponseMessage.BAD_GATEWAY} : $e");
  //       message = ResponseMessage.BAD_GATEWAY;
  //     } else if (e == ApiStatus.GATEWAY_TIMEOUT) {
  //       log("${ResponseMessage.GATEWAY_TIMEOUT} : $e");
  //       message = ResponseMessage.GATEWAY_TIMEOUT;
  //     } else if (e == ApiStatus.HTTP_VERSION_NOT_SUPPORTED) {
  //       log("${ResponseMessage.HTTP_VERSION_NOT_SUPPORTED} : $e");
  //       message = ResponseMessage.HTTP_VERSION_NOT_SUPPORTED;
  //     } else if (e == ApiStatus.INSUFFICIENT_STORAGE) {
  //       log("${ResponseMessage.INSUFFICIENT_STORAGE} : $e");
  //       message = ResponseMessage.INSUFFICIENT_STORAGE;
  //     } else if (e == ApiStatus.LOOP_DETECTED) {
  //       log("${ResponseMessage.LOOP_DETECTED} : $e");
  //       message = ResponseMessage.LOOP_DETECTED;
  //     } else if (e == ApiStatus.TOO_MANY_REQUESTS) {
  //       log("${ResponseMessage.TOO_MANY_REQUESTS} : $e");
  //       message = ResponseMessage.TOO_MANY_REQUESTS;
  //     } else if (e == ApiStatus.SERVICE_UNAVAILABLE) {
  //       log("${ResponseMessage.SERVICE_UNAVAILABLE} : $e");
  //       message = ResponseMessage.SERVICE_UNAVAILABLE;
  //     } else if (e == ApiStatus.NOT_IMPLEMENTED) {
  //       log("${ResponseMessage.NOT_IMPLEMENTED} : $e");
  //       message = ResponseMessage.NOT_IMPLEMENTED;
  //     } else if (e == ApiStatus.INCORRECT_API_KEY_PROVIDED) {
  //       log("${ResponseMessage.INCORRECT_API_KEY_PROVIDED} : $e");
  //       message = ResponseMessage.INCORRECT_API_KEY_PROVIDED;
  //     } else if (e == ApiStatus.NOT_AUTHORIZED_MEMBER_TO_USE_API) {
  //       log("${ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API} : $e");
  //       message = ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API;
  //     } else if (e == ApiStatus.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED) {
  //       log("${ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED} : $e");
  //       message = ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED;
  //     } else if (e == ApiStatus.DATA_LIMIT_REACHED_FOR_REQUESTS) {
  //       log("${ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS} : $e");
  //       message = ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS;
  //     } else if (e == ApiStatus.ENGINE_OVERLOAD) {
  //       log("${ResponseMessage.ENGINE_OVERLOAD} : $e");
  //       message = ResponseMessage.ENGINE_OVERLOAD;
  //     } else if (e == ApiStatus.NO_CONTENT) {
  //       log("${ResponseMessage.NO_CONTENT} : $e");
  //       message = ResponseMessage.NO_CONTENT;
  //     } else if (e == ApiStatus.FORBIDDEN) {
  //       log("${ResponseMessage.FORBIDDEN} : $e");
  //       message = ResponseMessage.FORBIDDEN;
  //     } else if (e == ApiStatus.DEFAULT) {
  //       log("${ResponseMessage.DEFAULT} : $e");
  //       message = ResponseMessage.DEFAULT;
  //     }

  //     return Left(Failure(
  //       message: message,
  //       code: 500,
  //     ));
  //   }
  // }
}
