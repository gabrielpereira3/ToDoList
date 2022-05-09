import 'package:flutter/material.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          tasks.add(text);
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
                      for(String task in tasks)
                        TodoListItem(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Você possui 0 tarefas pendentes",
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
      );
  }
}