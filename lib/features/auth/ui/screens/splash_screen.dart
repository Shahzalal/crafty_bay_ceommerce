import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/screens/main_bottom_nav_screen.dart';

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
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    // Navigator.pushReplacementNamed(context, SignUpScreen.name);
    // Navigator.pushReplacementNamed(context, LoginScreen.name);
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
