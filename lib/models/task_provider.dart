import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase_flutter/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_firebase_flutter/user_id.dart';

var db = FirebaseFirestore.instance;

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  getData() async {
    List<Map<String, dynamic>> documents = [];
    // List<String>?taskList = [];
    var data = await db
        .collection("tasks")
        .doc("${LocalUser.currentUserId}")
        .collection("userTasks")
        .get();

    data.docs.forEach((element) {
      documents.add(element.data());
    });
    tasks = documents
        .map((e) => Task(name: e['task'], isDone: e['isDone']))
        .toList();
    print(tasks);
    notifyListeners();
  }

  void addTask(String newTask) {
    tasks.add(Task(name: newTask));
    print("task added");

    final docData = {
      "task": newTask,
      "createdAt": DateTime.now(),
      "updatedAt": DateTime.now(),
      "isDone": false,
    };

    db
        .collection("tasks")
        .doc("${LocalUser.currentUserId}")
        .collection("userTasks")
        .doc()
        .set(docData);
    notifyListeners();
  }

  void updateTask(Task task) {
    final Map<String, dynamic> updateData = {
      'isDone': !task.isDone,
      'updatedAt': DateTime.now()
    };
    db
        .collection("tasks")
        .doc("${LocalUser.currentUserId}")
        .collection("userTasks")
        .where("task", isEqualTo: task.name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        String docID = element.id;
        db
            .collection("tasks")
            .doc("${LocalUser.currentUserId}")
            .collection("userTasks")
            .doc(docID)
            .update(updateData);
      });
    });
    task.tooglesCheckbox();
    print("task updated");
    notifyListeners();
  }

  void deleteTask(int index) {
    db
        .collection("tasks")
        .doc("${LocalUser.currentUserId}")
        .collection("userTasks")
        .where("task", isEqualTo: tasks[index].name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        String docID = element.id;
        db
            .collection("tasks")
            .doc("${LocalUser.currentUserId}")
            .collection("userTasks")
            .doc(docID)
            .delete();
      });
    });

    print("task removed ${tasks[index].name}");
    tasks.removeAt(index);
    notifyListeners();
  }
}
