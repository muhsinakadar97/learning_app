import 'dart:developer';

import 'package:get/get.dart';
import 'package:learningapp/src/data/repositories/todo_repo_impl/todo_repo_impl.dart';

import '../../config/data_state/data_state.dart';
import '../../data/models/todo.dart';

class TodosController extends GetxController {
  final todoRepo = TodoRepoImpl();

  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  Rx<DataState<List<TodoModel>>> state =
      DataState<List<TodoModel>>.initial().obs;

  RxList<TodoModel> fetchedTodosList = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    state.value = DataState.initial();
    final result = await todoRepo.fetchTodos();

    result.fold(
      (failure) {
        state.value = DataState.failure(failure);
        errorMessage.value = failure.toString();
      },
      (fetchedTodos) {
        state.value = DataState.success(fetchedTodos);
        fetchedTodosList.value = fetchedTodos;
        log("Fetched Todos from todo controller => ${fetchedTodosList.length}");
      },
    );
  }
}
