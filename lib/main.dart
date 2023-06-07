import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase_flutter/firebase_options.dart';
import 'package:todo_firebase_flutter/screens/welcome_screen.dart';
import 'package:todo_firebase_flutter/screens/chat_screen.dart';
import 'package:todo_firebase_flutter/screens/login_screen.dart';
import 'package:todo_firebase_flutter/screens/registration_screen.dart';
import 'package:todo_firebase_flutter/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase_flutter/models/task_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black54),
          ),
        ),
        //initialRoute:WelcomeScreen.id,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id:(context)=>WelcomeScreen(),
          LoginScreen.id:(context)=>LoginScreen(),
          RegistrationScreen.id:(context)=>RegistrationScreen(),
          ChatScreen.id:(context)=>ChatScreen(),
          TasksScreen.id:(context)=>TasksScreen(),
        },
      ),
    );
  }
}

