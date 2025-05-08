import'package:flutter/material.dart';


void main()=> runApp(TodoApp());

class TodoApp extends StatefulWidget {

@override
State<TodoApp> createState() => _TodoAppState();
}
class _TodoAppState extends State<TodoApp> {

  final List<String> _tasks = [];
  final TextEditingController _controller  = TextEditingController();

  void _addTask(String task) {
    if(task.isNotEmpty){
      setState(() {
        _tasks.add(task);
      });
      _controller.clear();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('ToDo App'),
    ),
    body: Column(
      children: [
        Padding(padding: EdgeInsets.all(8),
        child: TextField(
          controller: _controller,decoration: InputDecoration(
            labelText:'Add a Task',suffixIcon: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addTask(_controller.text),
          ),
        ),
        )
        ),
        Expanded(child: ListView.builder(itemCount: _tasks.length,
        itemBuilder:(context,index)=>ListTile(
          title: Text(_tasks[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.red,),
            onPressed: () => _removeTask(index),
          ),
        ),
        ))
      ],
    ),
  ),
  debugShowCheckedModeBanner: false,
);
}
}
