import 'package:dartz/dartz.dart';
import 'package:learningapp/src/config/network/failure.dart';
import 'package:learningapp/src/data/models/todo.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<TodoModel>>> fetchTodos();
}
