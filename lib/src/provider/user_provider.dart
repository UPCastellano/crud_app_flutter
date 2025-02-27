import 'package:flutter/material.dart';
import 'package:crud_app/src/database/db_helper.dart';
import 'package:crud_app/src/model/user.dart';

class UserProvider extends ChangeNotifier{
 
  static List<User> _userList = [];
 
  List<User> get userList => _userList;
 
   
  Future<void> addUser(String nombre, String apellidos, String email) async{   
    User user = User(nombre: nombre, apellidos: apellidos, email: email);
    await DBHelper.instance.createUser(user);
 
    listUsers();
  }
 
  Future<void> updateUser(User user) async{
    await DBHelper.instance.updateUser(user);
     
    listUsers();
  } 
 
  Future<void> deleteUser(int id) async{
    await DBHelper.instance.deleteUser(id);
 
    listUsers();
  }
 
  Future<void> listUsers() async{
    _userList = await DBHelper.instance.listUsers();
 
    notifyListeners();
  }
}