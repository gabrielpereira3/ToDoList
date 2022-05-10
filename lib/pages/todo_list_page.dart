import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Adicione uma tarefa",
                            hintText: "Ex. Estudar Flutter",
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState(() {
                            Task newTask = Task(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            tasks.add(newTask);
                          });
                          todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00E1E5),
                          padding: EdgeInsets.all(14),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for(Task task in tasks)
                          TodoListItem(
                            task: task,
                            onDelete: onDelete;
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Você possui ${tasks.length} tarefas pendentes",
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("Limpar Tudo"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff00E1E5),
                            padding: EdgeInsets.all(14),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  void onDelete (Task task){
    setState(() {
      tasks.remove(task);
    });
  }

}