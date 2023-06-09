import 'package:provider/provider.dart';
import 'package:todo_firebase_flutter/components/rounded_button.dart';
import 'package:todo_firebase_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:todo_firebase_flutter/screens/task_screen.dart';
import 'package:todo_firebase_flutter/user_id.dart';

import '../models/task_provider.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },style: kTextFieldTextColor,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },style: kTextFieldTextColor,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.lightBlueAccent, onPres: () async{
                setState(() {
                  showSpinner = true;
                });
                try{
                  final logInUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  LocalUser.currentUserId = _auth.currentUser!.uid;
                  if(await _auth.currentUser!=null){
                    Provider.of<TaskProvider>(context,listen: false).getData();
                    Navigator.pushNamed(context,TasksScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }catch(e){
                  Navigator.pop(context);
                }

              }, text: 'Log In'),
            ],
          ),
        ),
      ),
    );
  }
}