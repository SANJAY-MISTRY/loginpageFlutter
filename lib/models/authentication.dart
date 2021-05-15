import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loginpage/models/http_exception.dart';
import 'http_exception.dart';
class Authentication with ChangeNotifier
{
  Future<void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA2cqK3Jt1CkFfNNcE44WUgjQsUmNfatSw';
    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
      // print(responseData);
    }catch(error)
    {
      throw error;
    }
    final response = await http.post(url, body: json.encode(
      {
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));
    final responseData = json.decode(response.body);
    print(responseData);
  }


  Future<void> login(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA2cqK3Jt1CkFfNNcE44WUgjQsUmNfatSw';
    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
      // print(responseData);
    }catch(error)
    {
      throw error;
    }

  }
}