import 'package:flutter/material.dart';
import 'package:loginpage/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'package:loginpage/models/authentication.dart';
// import 'package:loginpage/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  Map<String, String> _authData = {
    'email' : '',
    'password': ''
  };
  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
    {
      return;
    }
    _formKey.currentState.save();
     await Provider.of<Authentication>(context, listen: false).signUp(
        _authData['email'] ,
        _authData['password']
     );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        actions: [
          FlatButton(
            child: Row(
              children: [
                Text('Login'),
                Icon(Icons.person_add)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },

          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blueGrey,
                      Colors.blueGrey,
                    ]
                )
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value)
                        {
                          if(value.isEmpty || !value.contains('@'))
                          {
                            return "invalid email";
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authData['email'] = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'password'),
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value){
                          if(value.isEmpty || value.length <= 5){
                            return 'invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authData['password'] = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value){
                          if(value.isEmpty || value != _passwordController.text){
                            return 'invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){

                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        child: Text(
                            'Submit'
                        ),
                        onPressed: () {
                          _submit();
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
