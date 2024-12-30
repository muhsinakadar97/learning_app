import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:learningapp/src/config/network/failure.dart';
import 'package:learningapp/src/core/urls.dart';
import 'package:learningapp/src/data/models/todo.dart';
import 'package:learningapp/src/data/services/data_access/api_service.dart';

import '../../../domain/repositories/todo_repo/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  ApiService apiService = ApiService();
  // late final ApiService apiService; // Using 'late' for deferred initialization

  // TodoRepoImpl() {
  //   apiService = ApiService(); // If this is missing, the error occurs
  // }

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
        Failure failure = Failure(
            message: 'Failed to fetch todos', code: response.statusCode);
        return left(failure);
      }
    } catch (e) {
      log("Error in fetching data: $e");
      return Left(Failure(
        message: e.toString(),
        code: 500,
      ));
    }
  }
}
