import 'package:flutter/material.dart';
import 'package:myapp/method/thongbao.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/page-1/TrangChuNVNew.dart';
import 'package:myapp/page-1/dangki.dart';
import 'package:myapp/page-1/dangnhap.dart';
import 'package:myapp/page-1/chaomung.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/page-1/thanhtoanthanhcong.dart';
import 'package:myapp/user_auth/services/UserManagement.dart';
import 'firebase_options.dart';
import 'page-1/TrangChuNew.dart';
import 'package:flutter/foundation.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	if (kIsWeb) {
		await Firebase.initializeApp(
			options: const FirebaseOptions(
				apiKey: "AIzaSyBTO49_sM21B9bqvHFzpFjn2-an2NWQKiM",
				appId: "1:443225333655:android:e5779c592a429d558d6ed2",
				messagingSenderId: "443225333655",
				projectId: "hicaphe",
				// Your web Firebase config options
			),
		);
	} else {
		await Firebase.initializeApp();
	}
	await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
	// thông báo ngoài ứng dụng
	await FirebaseApi().initNotifications();
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	// const MyApp({super.key});
	UserManagement userObj = new UserManagement();


	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter',
			debugShowCheckedModeBanner: false,
			navigatorKey: navigatorKey,
			routes: {
				'/': (context) => const ChaoMungPage(
					// Here, you can decide whether to show the LoginPage or HomePage based on user authentication
					child: DangNhap(),
				),
				'/login': (context) => const DangNhap(),
				'/signUp': (context) => const DangKi(),
				'/admin': (context) => TrangChuNew(),
				'/nhanvien': (context) => TrangChuNVNew(),
				'/khachhang': (context) => QuanLyKH(),
				'/notification_screen': (context)=> const SuccessScreen(),

			},
		);
	}
}
