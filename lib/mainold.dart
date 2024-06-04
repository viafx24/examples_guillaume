import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const UserProfileWidget(),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/user_avatar.png'),
          ),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'johndoe@example.com',
            style: TextStyle(fontSize: 16),
          )
          ,
        ],
      ),
    );
  }
}

