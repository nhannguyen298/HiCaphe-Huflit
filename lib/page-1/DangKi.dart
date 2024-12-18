import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'DangNhap.dart';
import 'package:myapp/utils.dart';

class DangKi extends StatefulWidget {
  const DangKi({super.key});

  @override
  State<DangKi> createState() => _DangKi();
}

class _DangKi extends State<DangKi> {
  final formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(19, 8, 19, 177),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                        AssetImage('assets/page-1/images/hinhnen1-bg.png'),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 93),
                          width: double.infinity,
                          height: 130,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 10,
                                top: 92,
                                child: SizedBox(
                                  width: 302,
                                  height: 50,
                                ),
                              ),
                              Positioned(
                                left: -20,
                                right: -20,
                                top: 96.5,
                                child: Align(
                                  child: SizedBox(
                                    width: 322,
                                    height: 30,
                                    child: Text(
                                      'Thưởng thức vị ngon trọn vẹn',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Dancing Script',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 / fem,
                                        letterSpacing: 1,
                                        color: const Color(0xff993300),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 110,
                                right: 110,
                                child: Align(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      'assets/page-1/images/logomau.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                          padding: const EdgeInsets.fromLTRB(24, 3, 25, 32),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xb2f5dab1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 49),
                                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                width: double.infinity,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff993300)),
                                  color: const Color(0xfffcf2d9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 35.5, 0),
                                      width: 87.9,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const DangNhap()),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero),
                                        child: Text(
                                          'Đăng nhập',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.25 / fem,
                                            color: const Color(0xff993300),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 160,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff993300),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Đăng kí',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.25 / fem,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                height: 50,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email không được trống';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  style: SafeGoogleFont(
                                    'Quicksand',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500, // Changed font weight
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: const BorderSide(
                                          color: Color(0xff993300), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff993300)),
                                    ),
                                    suffixIcon: const Icon(Icons.email),
                                    suffixIconColor: const Color(0xff993300),
                                    hintStyle: const TextStyle(
                                        color: Color(0xff993300)),
                                    hintText: "Nhập Email",
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                height: 50,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Mật khẩu không được trống';
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: !_passwordVisible,
                                  controller: _passwordController,
                                  style: SafeGoogleFont(
                                    'Quicksand',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500, // Changed font weight
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      borderSide: const BorderSide(
                                          color: Color(0xff993300), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff993300)),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xff993300),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                    suffixIconColor: const Color(0xff993300),
                                    hintStyle: const TextStyle(
                                        color: Color(0xff993300)),
                                    hintText: "Nhập lại mật khẩu",
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _signUp,
                                child: Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(50, 40, 59, 0),
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff993300),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Đăng kí',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25 / fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ElevatedButton.icon(
                                  onPressed: _signUpWithGoogle,
                                  icon: const Icon(Icons.login),
                                  label: const Text('Đăng ký bằng Google'),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: SafeGoogleFont(
                                      'Quicksand',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffffffff),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          await _addUserDataToFirestore(user);
          Fluttertoast.showToast(msg: 'Đăng ký bằng Google thành công!');
          Navigator.pushReplacementNamed(context, "/login");
        } else {
          Fluttertoast.showToast(msg: 'Đăng ký bằng Google thất bại!');
        }
      }
    } catch (e) {
      print("Error during sign up with Google: $e");
      Fluttertoast.showToast(msg: 'Đăng ký bằng Google thất bại!');
    }
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (formKey.currentState!.validate()) {
      if (email.isEmpty || password.isEmpty) {
        Fluttertoast.showToast(msg: 'Bạn chưa điền thông tin');
        return;
      }

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        await _addUserDataToFirestore(user);
        Fluttertoast.showToast(msg: 'Đăng ký thành công!');
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        print("Some error happened");
      }
    }
  }

  Future<void> _addUserDataToFirestore(User user) async {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('Users');
    try {
      await usersCollection.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'role': 'khach hang',
        'displayName': '',
        'hinhanh': '',
      });
      print("User data added to Firestore");
    } catch (e) {
      print("Error adding user data to Firestore: $e");
    }
  }
}
