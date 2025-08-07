import 'package:crafty_bay_ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay_ecommerce/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
        body: SafeArea(
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                      AppLogo(width: 90,height: 90,),
                      const SizedBox(height: 16,),
                      Text('Welcome Back',style: textTheme.titleLarge,),
                      const SizedBox(height: 4,),
                      Text('Please enter your email & password',style: textTheme.headlineMedium,),
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: 'Email'),
                        validator: (String? value){
                          String emailValue = value??'';
                          if(EmailValidator.validate(emailValue)==false){
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _passwordTEController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (String ? value){
                          if((value?.length??0)<=6){
                            return 'Enter a password more than 6 letters ';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24,),
                      ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _onTapToLoginButton();
                        }
                      }, child: Text('Login'))
                    ],
                  ),
                ),
              ),
            ) ));
  }

  void _onTapToLoginButton(){
      Navigator.pushNamed(context, SignUpScreen.name);
  }
}
