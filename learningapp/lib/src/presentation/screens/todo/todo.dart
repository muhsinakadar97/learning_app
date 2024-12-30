import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/todo_controller.dart';

import '../../../data/models/todo.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    TodosController todosController = Get.put(TodosController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do Page"),
      ),
      body: Obx(() => ListView.builder(
          itemCount: todosController.fetchedTodosList.length,
          itemBuilder: (context, index) {
            TodoModel todoItem = todosController.fetchedTodosList[index];
            return Text(
              "${index + 1}. ${todoItem.title}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            );
          })),
    );
  }
}
