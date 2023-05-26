import 'package:flutter/material.dart';
import 'package:todo_firebase_flutter/screens/add_task_screen.dart';
import 'package:todo_firebase_flutter/components/task_tile.dart';
import 'package:todo_firebase_flutter/components/tasks_list.dart';
import 'package:todo_firebase_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase_flutter/models/task_provider.dart';

class TasksScreen extends StatelessWidget {
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${Provider.of<TaskProvider>(context).tasks.length} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 60),
                  ElevatedButton(
                      onPressed: (){
                        '${Provider.of<TaskProvider>(context,listen: false).getData()}';
                      },
                      style: ButtonStyle(),
                      child: Text("GET")),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(),
                      child: Text("SAVE")),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TasksList(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder:(context) => SingleChildScrollView(child: Container
            (padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen())),isScrollControlled: true);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}


