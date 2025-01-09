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
        final String message = _getErrorMessage(response.statusCode);
        final failure = Failure(message: message, code: response.statusCode);

        log("Error - Code: ${response.statusCode}, Message: $message");

        return Left(failure);
      }
    } catch (e) {
      String message = ResponseMessage.DEFAULT;
      int code = ResponseCode.DEFAULT;

      if (e is ClientException) {
        message = "Client Exception: ${e.message}";
        code = ResponseCode.BAD_REQUEST;
        log("ClientException occurred");
        log(message);
      } else if (e is SocketException) {
        message = "Network error: ${e.message}";
        code = ResponseCode.SERVICE_UNAVAILABLE;
        log("SocketException occurred");
        log(message);
      } else if (e is TimeoutException) {
        message = "Request Timeout";
        code = ResponseCode.REQUEST_TIMEOUT;
        log("TimeoutException occurred");
        log(message);
      } else if (e is FormatException) {
        message = "Format Exception: Invalid data format";
        code = ResponseCode.BAD_REQUEST;
        log("FormatException occurred");
        log(message);
      } else if (e is TypeError) {
        message = "TypeError: ${e.toString()}";
        code = ResponseCode.INTERNAL_SERVER_ERROR;
        log("TypeError occurred");
        log(message);
      } else {
        message = ResponseMessage.DEFAULT;
        code = ResponseCode.DEFAULT;
        log("Unknown error occurred");
        log(message);
      }

      return Left(Failure(message: message, code: code));
    }
  }

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
}
