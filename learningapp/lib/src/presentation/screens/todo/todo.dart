import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/todo_controller.dart';

import '../../../data/models/todo.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    TodosController todosController = Get.put(TodosController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        title: const Text(
          "To Do",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        // Check if there is an error message
        if (todosController.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              todosController.errorMessage.value,
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        }

        // Display the list of to-dos when there's no error
        return ListView.builder(
          itemCount: todosController.fetchedTodosList.length,
          itemBuilder: (context, index) {
            TodoModel todoItem = todosController.fetchedTodosList[index];
            return Text(
              "${index + 1}. ${todoItem.title}\n",
              style: GoogleFonts.raleway(fontSize: 18),
            );
            // return ListTile(
            //   title: Text(
            //     "${index + 1}. ${todoItem.title}",
            //     style: const TextStyle(color: Colors.black, fontSize: 18),
            //   ),
            // );
          },
        );
      }),
    );
  }
}
