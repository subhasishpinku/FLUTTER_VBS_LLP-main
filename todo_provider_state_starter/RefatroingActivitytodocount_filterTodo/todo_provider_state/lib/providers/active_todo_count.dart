// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_provider_state/models/todo_model.dart';
import 'package:todo_provider_state/providers/todo_list.dart';

class ActiveTodoCountState {
  final TodoList todoList;
  ActiveTodoCountState({
    required this.todoList,
  });

  ActiveTodoCountState get state => ActiveTodoCountState(
      activeTodoCount: todoList.state.todos
          .where((Todo todo) => !todo.completed.toList().length));
}
