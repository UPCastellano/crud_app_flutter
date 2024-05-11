import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_app/src/pages/user_form.dart';
import 'package:crud_app/src/pages/user_list.dart';
import 'package:crud_app/src/provider/user_provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD PROVEEDOR',
        initialRoute: 'userList',
        routes: {
          'userList': (BuildContext context) => const UserListPage(),
          'userForm': (BuildContext context) => const UserFormPage()
        }
      ),
    );
  }
}
