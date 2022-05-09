import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Preço",
                  hintText: "exemplo@exemplo.com",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(onPressed: login, child: Text('Entrar'))
            ],
          ),
          ),
        ),
      );
  }

  void login() {
    String text = emailController.text;
    print(text);
    emailController.clear();
  }
}