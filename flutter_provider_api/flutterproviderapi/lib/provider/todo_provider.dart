import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterproviderapi/model/todo.dart';
// import 'package:flutterproviderapi/services/todo_services.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  // final _service = TodoService();
  bool isLoading = false;
  // List<Todo> _todos = [];
  // List<Todo> get todos => _todos;

  // Future<void> getAllTodos() async {
  //   isLoading = true;
  //   notifyListeners();

  //   final response = await _service.getAll();

  //   _todos = response;
  //   isLoading = false;
  //   notifyListeners();
  // }

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      _todos = jsonData.map((json) => Todo.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
