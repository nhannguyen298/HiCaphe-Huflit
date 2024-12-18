import 'package:flutter/material.dart';

class AllUsersPage extends StatefulWidget {

  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All users allowed'),
        centerTitle: true,
      ),
    );
  }
}
