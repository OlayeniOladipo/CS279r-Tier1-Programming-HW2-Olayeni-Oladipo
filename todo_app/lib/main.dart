// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';

// Object-oriented class data structure. Requiring the parameters name
// and checked for whenever Todo is initialized. Declares the types as well.
class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

// StatelessWidget is one that doesn't require a mutable state.
// Class TodoItem defines this object, defining a struct for what TodoItem
// is made of. 
class TodoItem extends StatelessWidget {
  // super(key: ) used for flutter to recognize when a widget has changed.
  TodoItem({
    // this. points to the current class TodoItem.
    required this.todo,
    required this.onTodoChanged,
    required this.onTodoDeleted,
  }) : super(key: ObjectKey(todo));

  // final hardcodes the values of the variable and make its and its state unmutable
  // in the future.
  final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onTodoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onTodoDeleted;

  // a function returning the text style for TodoItem given its checked status.
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    // TextStyle is class defined in dart that has different attributes like 
    // color, decoration, fontStyle, spacing, and more.
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // ListTile is another class in dart with specific attributes.
    return ListTile(
      // onTap is called when a user taps the ListTile
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
      trailing: IconButton(
          // onPressed is a callback that listens and when triggered will do an action or trigger a state.
          onPressed: () {
            onTodoDeleted(todo);
          },
          icon: const Icon(Icons.delete, color: Colors.red)),
    );
  }
}

// Call the _TodoListState in order to evaluate what needs to happen and render.
class TodoList extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // A controller for an editable field to be called _textFieldController.
  final TextEditingController _textFieldController = TextEditingController();
  // List of todo items stored in _todos. The type Todo is defined in another class.
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Scaffold is a class for a visual scaffold of many types of widgets and more.
    return new Scaffold(
      // AppBar is like a header bar.
      appBar: new AppBar(
        title: const Text('Todo list'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        // .map does through every todo in _todos and returns a TodoItem.
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
            onTodoDeleted: _handleTodoDelete,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  // Helpfer function for what to do when the onTodoChanged state is triggered.
  void _handleTodoChange(Todo todo) {
    // Notifies the system that a state has changed which will likely prompt a rebuild and render. 
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  // Helpfer function for what to do when the onTodoDeleted state is triggered.
  void _handleTodoDelete(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  // Future is the result of an asynchronous computation.
  Future<void> _displayDialog() async {
    // showDialog is used to display a dialog on screen given context and a builder.
    return showDialog<void>(
      context: context, // used to look up the navigator of the dialog.
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                // Use of helper function to add the actual todo item.
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  // 
  @override
  Widget build(BuildContext context) {
    // Material App uses Material Design and many widgets.
    return new MaterialApp(
      title: 'Todo list',
      home: new TodoList(),
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
      ),
    );
  }
}

void main() => runApp(const TodoApp());
