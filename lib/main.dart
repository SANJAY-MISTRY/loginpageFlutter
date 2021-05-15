import 'package:flutter/material.dart';
import 'package:loginpage/screens/list_screen.dart';
import 'package:loginpage/screens/login_screen.dart';
import 'package:loginpage/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:loginpage/models/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Authentication(),
        )
      ],
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: SignupScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ListScreen.routeName: (ctx) => ListScreen(),
        },
      ),
    );
  }
}


