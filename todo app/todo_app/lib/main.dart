import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  String displayText = 'No text entered';

  List<String> taskList = [];

  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Todo App'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: textcontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Enter the Task')),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      displayText = textcontroller.text;

                      taskList.add(textcontroller.text);
                      textcontroller.clear();
                    });
                  },
                  color: Colors.blueAccent,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Add Task',
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, Index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(taskList[Index]),
                      ),
                    ),
                    MaterialButton(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(Index);
                        });
                      },
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
