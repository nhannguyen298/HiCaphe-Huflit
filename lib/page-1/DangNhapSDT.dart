import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/utils.dart';

class DangNhapSDT extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  DangNhapSDT({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/page-1/images/hinhnen1-bg.png'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 18 * fem, 262 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 143 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 113 * fem,
                      top: 16 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 100 * fem,
                          height: 100 * fem,
                          child: Image.asset(
                            'assets/page-1/images/logomau.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7 * fem,
                      top: 114 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 322 * fem,
                          height: 29 * fem,
                          child: Text(
                            'Thưởng thức vị ngon trọn vẹn',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Dancing Script',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: const Color(0xff993300),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0 * fem,
                      top: 30 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 32 * fem,
                          height: 32 * fem,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              'assets/page-1/images/vector.png',
                              width: 32 * fem,
                              height: 32 * fem,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 8 * fem, 0 * fem),
                padding: EdgeInsets.fromLTRB(25 * fem, 16 * fem, 25 * fem, 20 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xb2f5dab1),
                  borderRadius: BorderRadius.circular(30 * fem),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 30 * fem),
                        width: 300 * fem,
                        height: 45 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff993300),
                          borderRadius: BorderRadius.circular(90 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Đăng Nhập Bằng SĐT',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Quicksand',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      buildTextFormField(
                        controller: nameController,
                        hintText: "Nhập Tên",
                        icon: Icons.account_circle,
                        hintFontSize: 14 * ffem,
                        validator: (value) => value!.isEmpty ? 'Vui lòng nhập tên của bạn' : null,
                      ),
                      SizedBox(height: 10),
                      buildTextFormField(
                        controller: phoneController,
                        hintText: "Nhập số điện thoại",
                        icon: Icons.phone,
                        hintFontSize: 14 * ffem,
                        validator: (value) => value!.isEmpty ? 'Vui lòng nhập số điện thoại của bạn' : null,
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.fromLTRB(45, 25, 44, 0),
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff993300),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              validateAndSendOTP(context, phoneController.text.trim());
                            },
                            child: Text(
                              'Đăng Nhập',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Quicksand',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?)? validator,
    required double hintFontSize,
  }) {
    return TextFormField(
      controller: controller,
      style: SafeGoogleFont(
        'Quicksand',
        fontSize: 14,
        fontWeight: FontWeight.w500, // Changed font weight to w500
        color: Color(0xff993300), // Màu chữ text
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color(0xff993300), // Màu biểu tượng
        ),
        hintStyle: TextStyle(
          color: Color(0xff993300), // Màu chữ hint
          fontSize: hintFontSize,
        ),
        hintText: hintText,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Color(0xff993300), width: 1.0), // Màu viền khi enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Color(0xff993300), width: 1.0), // Màu viền khi focused
        ),
      ),
      validator: validator,
    );
  }

  void validateAndSendOTP(BuildContext context, String mobile) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: mobile,
          verificationCompleted: (PhoneAuthCredential credential) async {
            try {
              await FirebaseAuth.instance.signInWithCredential(credential);
              // Successfully signed in
            } catch (e) {
              print("Error: $e");
              // Handle sign in error
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            print("Verification failed: ${e.message}");
            // Handle verification failure
          },
          codeSent: (String verificationID, int? forceResendingToken) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Nhập mã OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.code),
                          hintText: 'Nhập mã OTP',
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                              verificationId: verificationID,
                              smsCode: otpController.text,
                            );
                            await FirebaseAuth.instance.signInWithCredential(credential);
                            // Successfully signed in
                            await registerUser(emailController.text.trim(), nameController.text.trim(), mobile);
                          } catch (e) {
                            print("Error: $e");
                            // Handle sign in error
                          }
                        },
                        child: const Text('Xác nhận'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          codeAutoRetrievalTimeout: (String verification) {},
        );
      } catch (e) {
        print("Error: $e");
        // Handle verification error
      }
    }
  }
}

Future<void> registerUser(String email, String displayName, String phoneNumber) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: 'randompassword', // Password is required, but not used since we're signing in via phone
    );

    // Update display name
    await userCredential.user!.updateDisplayName(displayName);

    // You can store additional user information to Firebase Firestore or Realtime Database here
  } catch (e) {
    print("Error registering user: $e");
    // Handle user registration error
  }
}
