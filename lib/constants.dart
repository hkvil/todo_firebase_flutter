import 'package:flutter/material.dart';

const kAppName = "Tododu";

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your password.',
  hintStyle: TextStyle(color: Colors.blueGrey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFieldTextColor = TextStyle(color: Colors.black);

const kWelcomeTextStyle =
TextStyle(fontSize: 35.0, fontWeight: FontWeight.w900, color: Colors.black);

//CONSTANT FOR TODO PART

const kTextFieldDecorationTodo = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 5,color: Colors.lightBlueAccent),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 5,color: Colors.lightBlueAccent),
    )
);

const kTitleTextStyleTaskScreen = TextStyle(
  color: Colors.white,
  fontSize: 50,
  fontWeight: FontWeight.w700,
);