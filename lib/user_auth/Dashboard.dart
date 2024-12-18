import 'package:flutter/material.dart';

import 'package:myapp/user_auth/AllUsers.dart';
import 'services/UserManagement.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  UserManagement userObj = new UserManagement();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Son Bao'),
                accountEmail: new Text('psonbao@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('https://i.pravatar.cc/200'),
                ),
            ),
            new ListTile(
              title: new Text('AllUsers Page'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AllUsersPage()));
              },
            ),
            new ListTile(
              title: new Text('Admins only'),
              onTap: () {
                Navigator.of(context).pop();
                userObj.authorizeAdmin(context);
              },
            ),
            new ListTile(
              title: new Text('Logout'),
              onTap: (){
                Navigator.of(context).pop();
                userObj.signOut();
              }),
          ],
        ),
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
