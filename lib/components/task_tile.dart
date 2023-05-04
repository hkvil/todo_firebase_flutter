import 'package:flutter/material.dart';
import 'package:todo_firebase_flutter/models/task.dart';

class TaskTile extends StatelessWidget {//NO
  TaskTile({required this.isChecked,required this.taskTitle,required this.checkboxCallback,required this.onLongPressCallback});

  final bool isChecked ;
  final String taskTitle;
  final checkboxCallback;
  final onLongPressCallback;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onLongPressCallback,
        title: Text(taskTitle,style: TextStyle(color: Colors.black,decoration:isChecked ?TextDecoration.lineThrough:TextDecoration.none ),),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged:checkboxCallback,
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
              if (states.contains(MaterialState.disabled)){
                return Colors.black;
              }
              return Colors.black;
            })
        )
    );
  }
}

// onChangedCheckbox(newValue) {
//   setState(() {
//     isChecked = newValue;
//   });
// }
