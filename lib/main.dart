import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/order_history_screen.dart'; // ✅ Import the new screen
import 'firebase_options.dart';
import 'screens/order_details_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connekt2Park Driver',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/home': (context) {
          final user = FirebaseAuth.instance.currentUser;
          return user != null ? HomeScreen(user: user) : const LoginScreen();
        },
        '/orderHistory': (context) => const OrderHistoryScreen(), // ✅ New route
        '/orderDetails': (context) => const OrderDetailsScreen(),
      },
    );
  }
}
