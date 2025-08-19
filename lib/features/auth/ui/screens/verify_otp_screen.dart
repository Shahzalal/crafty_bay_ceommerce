import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';
import 'login_screen.dart';


class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  static final String name='verify-otp';
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  final TextEditingController _otpTEController=TextEditingController();
  final GlobalKey<FormState> _otpVerify = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _otpVerify,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Center(
                child: Column(
                 children: [
                   const SizedBox(height: 50,),
                   AppLogo(width: 90, height: 90),
                   const SizedBox(height: 16,),
                   Text('Verify OTP',style: textTheme.titleLarge,),
                   const SizedBox(height: 4,),
                   Text('Please enter your 4 digits OTP sent to your ${widget.email}',
                     textAlign: TextAlign.center,
                     style: textTheme.headlineMedium,
                       ),
                   const SizedBox(height: 24,),
                   PinCodeTextField(
                     controller: _otpTEController,
                     length: 4,
                     obscureText: false,
                     animationType: AnimationType.fade,
                     animationDuration: Duration(milliseconds: 300),
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     keyboardType: TextInputType.number,
                     pinTheme: PinTheme(
                       shape: PinCodeFieldShape.box,
                       fieldWidth: 50,
                       fieldHeight: 50,
                     ),
                     appContext: context,
                   ),
                   const SizedBox(height: 16,),
                   ElevatedButton(onPressed: _onTapLoginButton, child: Text('Verify')),
                 ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapLoginButton(){
    Navigator.pushNamed(context, LoginScreen.name);
  }

  @override
  void dispose(){
    _otpTEController.dispose();
    super.dispose();
  }
}
