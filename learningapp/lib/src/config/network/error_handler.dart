// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'failure.dart';

enum ApiStatus {
  SUCCESS,
  BAD_REQUEST,
  UNAUTHORIZED,
  INVALID_AUTHENTICATION,
  NOT_FOUND,
  REQUEST_TIMEOUT,
  INTERNAL_SERVER_ERROR,
  BAD_GATEWAY,
  GATEWAY_TIMEOUT,
  HTTP_VERSION_NOT_SUPPORTED,
  INSUFFICIENT_STORAGE,
  LOOP_DETECTED,
  TOO_MANY_REQUESTS,
  SERVICE_UNAVAILABLE,
  NOT_IMPLEMENTED,
  INCORRECT_API_KEY_PROVIDED,
  NOT_AUTHORIZED_MEMBER_TO_USE_API,
  COUNTRY_REGION_TERRITORY_NOT_SUPPORTED,
  DATA_LIMIT_REACHED_FOR_REQUESTS,
  ENGINE_OVERLOAD,
  NO_CONTENT,
  FORBIDDEN,
  DEFAULT,
}

extension ErrorCheckingExtension on ApiStatus {
  Failure handleApiResponse({String? apiMessage}) {
    switch (this) {
      case ApiStatus.BAD_REQUEST:
        return const Failure(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);

      case ApiStatus.UNAUTHORIZED:
        return const Failure(
            code: ResponseCode.UNAUTHORIZED,
            message: ResponseMessage.UNAUTHORISED);

      case ApiStatus.INVALID_AUTHENTICATION:
        return const Failure(
            code: ResponseCode.INVALID_AUTHENTICATION,
            message: ResponseMessage.INVALID_AUTHENTICATION);

      case ApiStatus.NOT_FOUND:
        return const Failure(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);

      case ApiStatus.REQUEST_TIMEOUT:
        return const Failure(
            code: ResponseCode.REQUEST_TIMEOUT,
            message: ResponseMessage.REQUEST_TIMEOUT);

      case ApiStatus.INTERNAL_SERVER_ERROR:
        return const Failure(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);

      case ApiStatus.BAD_GATEWAY:
        return const Failure(
            code: ResponseCode.BAD_GATEWAY,
            message: ResponseMessage.BAD_GATEWAY);

      case ApiStatus.GATEWAY_TIMEOUT:
        return const Failure(
            code: ResponseCode.GATEWAY_TIMEOUT,
            message: ResponseMessage.GATEWAY_TIMEOUT);
      case ApiStatus.HTTP_VERSION_NOT_SUPPORTED:
        return const Failure(
            code: ResponseCode.HTTP_VERSION_NOT_SUPPORTED,
            message: ResponseMessage.HTTP_VERSION_NOT_SUPPORTED);
      case ApiStatus.INSUFFICIENT_STORAGE:
        return const Failure(
            code: ResponseCode.INSUFFICIENT_STORAGE,
            message: ResponseMessage.INSUFFICIENT_STORAGE);

      case ApiStatus.LOOP_DETECTED:
        return const Failure(
            code: ResponseCode.LOOP_DETECTED,
            message: ResponseMessage.LOOP_DETECTED);

      case ApiStatus.TOO_MANY_REQUESTS:
        return const Failure(
            code: ResponseCode.TOO_MANY_REQUESTS,
            message: ResponseMessage.TOO_MANY_REQUESTS);
      case ApiStatus.SERVICE_UNAVAILABLE:
        return const Failure(
            code: ResponseCode.SERVICE_UNAVAILABLE,
            message: ResponseMessage.SERVICE_UNAVAILABLE);
      case ApiStatus.NOT_IMPLEMENTED:
        return const Failure(
            code: ResponseCode.NOT_IMPLEMENTED,
            message: ResponseMessage.NOT_IMPLEMENTED);
      case ApiStatus.INCORRECT_API_KEY_PROVIDED:
        return const Failure(
            code: ResponseCode.INCORRECT_API_KEY_PROVIDED,
            message: ResponseMessage.INCORRECT_API_KEY_PROVIDED);
      case ApiStatus.NOT_AUTHORIZED_MEMBER_TO_USE_API:
        return const Failure(
            code: ResponseCode.NOT_AUTHORIZED_MEMBER_TO_USE_API,
            message: ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API);
      case ApiStatus.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED:
        return const Failure(
            code: ResponseCode.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED,
            message: ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED);

      case ApiStatus.DATA_LIMIT_REACHED_FOR_REQUESTS:
        return const Failure(
            code: ResponseCode.DATA_LIMIT_REACHED_FOR_REQUESTS,
            message: ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS);

      case ApiStatus.ENGINE_OVERLOAD:
        return const Failure(
            code: ResponseCode.ENGINE_OVERLOAD,
            message: ResponseMessage.ENGINE_OVERLOAD);
      case ApiStatus.NO_CONTENT:
        return const Failure(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT);

      case ApiStatus.FORBIDDEN:
        return const Failure(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);

      case ApiStatus.DEFAULT:
        return const Failure(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);

      default:
        return const Failure(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int INVALID_AUTHENTICATION = 401;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int GATEWAY_TIMEOUT = 504;
  static const int HTTP_VERSION_NOT_SUPPORTED = 505;

  static const int INSUFFICIENT_STORAGE = 507;

  static const int LOOP_DETECTED = 508;
  static const int TOO_MANY_REQUESTS = 529;
  static const int SERVICE_UNAVAILABLE = 503;

  static const int NOT_IMPLEMENTED = 501;
  static const int INCORRECT_API_KEY_PROVIDED = 401;
  static const int NOT_AUTHORIZED_MEMBER_TO_USE_API = 401;
  static const int COUNTRY_REGION_TERRITORY_NOT_SUPPORTED = 403;
  static const int DATA_LIMIT_REACHED_FOR_REQUESTS = 429;
  static const int ENGINE_OVERLOAD = 503;
  static const int NO_CONTENT = 201;

  static const int FORBIDDEN = 403;

  static const int DEFAULT = -1;
}

class ResponseMessage {
  static const String SUCCESS = 'success with data';
  static const String BAD_REQUEST = 'api rejected our request';
  static const String UNAUTHORISED = 'user is not authorised';
  static const String INVALID_AUTHENTICATION = 'authentication is invalid';
  static const String NOT_FOUND =
      'failure, API url is not correct and not found in api side.';
  static const String REQUEST_TIMEOUT = 'user request time out';
  static const String INTERNAL_SERVER_ERROR =
      'failure, a crash happened in API side.';
  static const String BAD_GATEWAY = 'bad gateway';
  static const String GATEWAY_TIMEOUT = 'gateway has timed out';
  static const String HTTP_VERSION_NOT_SUPPORTED = 'http version not supported';
  static const String INSUFFICIENT_STORAGE = 'insufficient storage';

  static const String LOOP_DETECTED = "loop detected";
  static const String TOO_MANY_REQUESTS = "too many requests";

  static const String NO_CONTENT = 'success with no content';
  static const String INCORRECT_API_KEY_PROVIDED = 'api key is invalid';
  static const String NOT_AUTHORIZED_MEMBER_TO_USE_API =
      'not authorized member to use api';
  static const String COUNTRY_REGION_TERRITORY_NOT_SUPPORTED =
      'country, region, territory not supported';
  static const String FORBIDDEN = 'api rejected our request';

  static const String DATA_LIMIT_REACHED_FOR_REQUESTS =
      'data limit reached for requests';

  static const String NOT_IMPLEMENTED = 'not implemented';
  static const String SERVICE_UNAVAILABLE = 'service unavailable';
  static const String ENGINE_OVERLOAD = 'engine overloaded';

  static const String DEFAULT = 'Something went wrong';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

handleApiResponse(http.Response response) {
  ApiStatus status;

  switch (response.statusCode) {
    case 200:
    case 201:
      return json.decode(response.body);
    case ResponseCode.BAD_REQUEST:
      status = ApiStatus.BAD_REQUEST;
      log(ResponseMessage.BAD_REQUEST);
      break;

    case ResponseCode.UNAUTHORIZED:
      status = ApiStatus.UNAUTHORIZED;
      log(ResponseMessage.UNAUTHORISED);

      break;

    case ResponseCode.INVALID_AUTHENTICATION:
      status = ApiStatus.INVALID_AUTHENTICATION;
      log(ResponseMessage.INVALID_AUTHENTICATION);

      break;

    case ResponseCode.NOT_FOUND:
      status = ApiStatus.NOT_FOUND;
      log(ResponseMessage.NOT_FOUND);

      break;

    case ResponseCode.REQUEST_TIMEOUT:
      status = ApiStatus.REQUEST_TIMEOUT;
      log(ResponseMessage.REQUEST_TIMEOUT);

      break;

    case ResponseCode.INTERNAL_SERVER_ERROR:
      status = ApiStatus.INTERNAL_SERVER_ERROR;
      log(ResponseMessage.INTERNAL_SERVER_ERROR);

      break;

    case ResponseCode.BAD_GATEWAY:
      status = ApiStatus.BAD_GATEWAY;
      log(ResponseMessage.BAD_GATEWAY);

      break;

    case ResponseCode.GATEWAY_TIMEOUT:
      status = ApiStatus.GATEWAY_TIMEOUT;
      log(ResponseMessage.GATEWAY_TIMEOUT);

      break;

    case ResponseCode.HTTP_VERSION_NOT_SUPPORTED:
      status = ApiStatus.HTTP_VERSION_NOT_SUPPORTED;
      log(ResponseMessage.HTTP_VERSION_NOT_SUPPORTED);

      break;

    case ResponseCode.INSUFFICIENT_STORAGE:
      status = ApiStatus.INSUFFICIENT_STORAGE;
      log(ResponseMessage.INSUFFICIENT_STORAGE);

      break;

    case ResponseCode.LOOP_DETECTED:
      status = ApiStatus.LOOP_DETECTED;
      log(ResponseMessage.LOOP_DETECTED);

      break;

    case ResponseCode.TOO_MANY_REQUESTS:
      status = ApiStatus.TOO_MANY_REQUESTS;
      log(ResponseMessage.TOO_MANY_REQUESTS);

      break;

    case ResponseCode.SERVICE_UNAVAILABLE:
      status = ApiStatus.SERVICE_UNAVAILABLE;
      log(ResponseMessage.SERVICE_UNAVAILABLE);

      break;

    case ResponseCode.NOT_IMPLEMENTED:
      status = ApiStatus.NOT_IMPLEMENTED;
      log(ResponseMessage.NOT_IMPLEMENTED);

      break;

    case ResponseCode.INCORRECT_API_KEY_PROVIDED:
      status = ApiStatus.INCORRECT_API_KEY_PROVIDED;
      log(ResponseMessage.INCORRECT_API_KEY_PROVIDED);

      break;

    case ResponseCode.NOT_AUTHORIZED_MEMBER_TO_USE_API:
      status = ApiStatus.NOT_AUTHORIZED_MEMBER_TO_USE_API;
      log(ResponseMessage.NOT_AUTHORIZED_MEMBER_TO_USE_API);

      break;

    case ResponseCode.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED:
      status = ApiStatus.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED;
      log(ResponseMessage.COUNTRY_REGION_TERRITORY_NOT_SUPPORTED);

      break;

    case ResponseCode.DATA_LIMIT_REACHED_FOR_REQUESTS:
      status = ApiStatus.DATA_LIMIT_REACHED_FOR_REQUESTS;
      log(ResponseMessage.DATA_LIMIT_REACHED_FOR_REQUESTS);
      break;

    case ResponseCode.ENGINE_OVERLOAD:
      status = ApiStatus.ENGINE_OVERLOAD;
      log(ResponseMessage.ENGINE_OVERLOAD);

      break;

    case ResponseCode.NO_CONTENT:
      status = ApiStatus.NO_CONTENT;
      log(ResponseMessage.NO_CONTENT);

      break;

    case ResponseCode.FORBIDDEN:
      status = ApiStatus.FORBIDDEN;
      log(ResponseMessage.FORBIDDEN);

      break;

    default:
      status = ApiStatus.DEFAULT;
      break;
  }
}
