import 'package:crafty_bay_ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay_ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    // Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text('Version', style: TextStyle(letterSpacing: .4)),
            ],
          ),
        ),
      ),
    );
  }
}
