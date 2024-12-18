import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

  //Pages
import 'package:myapp/page-1/dangnhap.dart';
import '../Dashboard.dart';
import '../AdminOnly.dart';

class UserManagement {
  BehaviorSubject currentUser = BehaviorSubject<String>.seeded('nouser');

  Widget handleAuth() {
    return new StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data?.uid);
          currentUser.add(snapshot.data?.uid);
          return DashboardPage();
        }
        return DangNhap();
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  authorizeAdmin(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user?.uid)
          .get()
          .then((docs) {
        if (docs.docs.isNotEmpty) {
          String role = docs.docs[0]['role'];
          if (role == 'admin') {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new AdminPage()));
          } else {
            print('Not Authorized');
          }
        } else {
          print('No documents found');
        }
      });
    });
  }
}