import 'package:crafty_bay_ecommerce/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce/features/auth/data/model/sign_up_request_model.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/widgets/snack_bar_message.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formSingUp = GlobalKey<FormState>();

  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formSingUp,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                AppLogo(width: 90, height: 90),
                const SizedBox(height: 16),
                Text('Register Account', style: textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'Please enter your details to sign-up',
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    String emailValue = value ?? '';
                    if (EmailValidator.validate(emailValue) == false) {
                      return 'Enter your valid Email Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Mobile Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _cityTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your City';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Address'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (String? value) {
                    if ((value?.length ?? 0) <= 6) {
                      return 'Enter your Password At-least 6 letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                GetBuilder<SignUpController>(
                  builder: (_) {
                    return Visibility(
                      visible: _signUpController.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapSignUp,
                        child: Text('Sign Up'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignUp() async {
    if (_formSingUp.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        password: _passwordTEController.text.trim(),
        city: _cityTEController.text.trim(),
        phone: _mobileTEController.text.trim(),
      );
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        showSnackBarMessage(context, _signUpController.message);
        Navigator.pushNamed(
          context,
          VerifyOtpScreen.name,
          arguments: _emailTEController.text.trim(),
        );
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
