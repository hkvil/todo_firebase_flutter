import 'package:todo_firebase_flutter/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:todo_firebase_flutter/screens/task_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.blueAccent, onPres: () async{
                setState(() {
                  showSpinner = true;
                });
                try{
                  final createdUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(createdUser != null){
                    Navigator.pushNamed(context, TasksScreen.id);
                  }else{
                    print("fail to create user");
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }catch(e){
                  Navigator.pop(context);
                }
              }, text: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}