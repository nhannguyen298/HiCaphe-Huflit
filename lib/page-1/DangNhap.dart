import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/page-1/DangKi.dart';
import 'package:myapp/page-1/DangNhapSDT.dart';
import 'package:myapp/page-1/QuenMatKhau.dart';
import 'package:myapp/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class DangNhap extends StatefulWidget {
  const DangNhap({super.key});

  @override
  State<DangNhap> createState() => _DangNhap();
}

class _DangNhap extends State<DangNhap> {
  final formKey = GlobalKey<FormState>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _passwordVisible = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(26, 8, 26, 154),
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
                          margin: const EdgeInsets.fromLTRB(4, 0, 2, 93),
                          width: double.infinity,
                          height: 130,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 110,
                                right: 110,
                                top: 5,
                                child: Align(
                                  alignment: Alignment.center,
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
                              Positioned(
                                left: -20,
                                right: -20,
                                top: 99,
                                child: SizedBox(
                                  width: 360,
                                  height: 31,
                                  child: Center(
                                    child: Text(
                                      'Thưởng thức vị ngon trọn vẹn',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Dancing Script',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                        letterSpacing: 1,
                                        color: const Color(0xff993300),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                          decoration: BoxDecoration(
                            color: const Color(0xb2f5dab1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 49),
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 36.5, 0),
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
                                      width: 155,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff993300),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Đăng nhập',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.25,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                      const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const DangKi()),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero),
                                        child: Text(
                                          'Đăng kí',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.25,
                                            color: const Color(0xff993300),
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
                                    hintText: "Nhập thư điện tử",
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                    suffixIconColor: const Color(0xff007373),
                                    hintStyle: const TextStyle(
                                        color: Color(0xff993300)),
                                    hintText: "Nhập mật khẩu",
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                const EdgeInsets.fromLTRB(154, 0, 0, 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QuenMatKhau()));
                                  },
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    'Quên mật khẩu',
                                    style: SafeGoogleFont(
                                      'Quicksand',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: const Color(0xff993300),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _signIn,
                                child: Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(50, 0, 39, 0),
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff993300),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Đăng nhập',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DangNhapSDT()),
                                  );
                                },
                                child: Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(50, 10, 39, 0),
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff993300),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Đăng Nhập bằng sđt',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
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

  void _signInWithGoogle() async {
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
          Fluttertoast.showToast(msg: 'Đăng nhập thành công!');
        } else {
          Fluttertoast.showToast(msg: 'Đăng nhập thất bại!');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'Đăng nhập thất bại!');
    }
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (formKey.currentState!.validate()) {}
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: 'Bạn chưa điền thông tin');
      return;
    }
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      FirebaseFirestore.instance
          .collection('Users')
          .where('uid', isEqualTo: user.uid)
          .get()
          .then((docs) {
        if (docs.docs.isNotEmpty) {
          String role = docs.docs[0]['role'];
          if (role == 'admin') {
            Navigator.pushReplacementNamed(context, "/admin");
          } else if (role == 'nhanvien') {
            Navigator.pushReplacementNamed(context, "/nhanvien");
          } else {
            Navigator.pushReplacementNamed(context, "/khachhang");
          }
        } else {
          Fluttertoast.showToast(msg: 'Email hoặc mật khẩu không tồn tại');
          print("User's document not found in Firestore");
        }
        Fluttertoast.showToast(msg: 'Đăng nhập thành công!');
      });
    } else {
      print("Some error happened");
      Fluttertoast.showToast(msg: 'Đăng nhập thất bại!');
      Fluttertoast.showToast(
          msg: 'Mật khẩu hoặc tài khoản không chính xác, vui lòng nhập lại');
    }
  }
}
