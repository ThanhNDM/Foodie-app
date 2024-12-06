import 'package:flutter/material.dart';
import '../../components/button/app_elevated_button.dart';
import '../../components/text_field/app_text_field.dart';
import '../../components/text_field/app_text_field_password.dart';
import '../../resources/app_color.dart';
import '../../resources/app_style.dart';
import '../cart/cart_page_2.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 120.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back',
                  style: AppStyle.h24Normal,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Login to your account',
                  style: AppStyle.h18Normal.copyWith(color: AppColor.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60.0),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email or Phone',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                AppTextFieldPassword(
                  controller: passwordController,
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 6.0),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColor.red, fontSize: 16.8),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 60.0),
                AppElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const CartPage2()),
                    (Route<dynamic> route) => false,
                  ),
                  text: 'Login',
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account, ',
                        style: TextStyle(color: AppColor.grey, fontSize: 16.8)),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      ),
                      child: const Text('Sign up',
                          style:
                              TextStyle(color: AppColor.red, fontSize: 16.8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
