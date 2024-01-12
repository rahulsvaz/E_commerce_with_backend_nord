import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_node/common/widgets/button.dart';
import 'package:shopping_cart_with_node/common/widgets/textfield.dart';
import 'package:shopping_cart_with_node/features/authentication/services/auth_services.dart';
import 'package:shopping_cart_with_node/features/authentication/viewModel/auth_screen_provider.dart';
import 'package:shopping_cart_with_node/global_variables/global_variables.dart';

// ignore: constant_identifier_names
enum Auth { SignIn, SignUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  //final _signInFormKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUp() {
    authServices.signUpUser(
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthScreenProvider>(context);
    final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Consumer<AuthScreenProvider>(builder: (context, value, child) {
                return ListTile(
                  tileColor: authProvider.auth == Auth.SignUp
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.SignUp,
                    groupValue: authProvider.auth,
                    onChanged: (Auth? value) {
                      authProvider.changeAuth(value!);
                    },
                  ),
                  title: const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }),
              if (authProvider.auth == Auth.SignUp)
                Container(
                  color: GlobalVariables.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AppTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AppTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomButton(callback: () {
                          signUp();
                          
                        }, label: 'Sign Up'),
                      ],
                    ),
                  ),
                ),
              Consumer<AuthScreenProvider>(builder: (context, value, child) {
                return ListTile(
                  tileColor: authProvider.auth == Auth.SignIn
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.SignIn,
                    groupValue: authProvider.auth,
                    onChanged: (Auth? value) {
                      authProvider.changeAuth(value!);
                    },
                  ),
                  title: const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }),
              if (authProvider.auth == Auth.SignIn)
                Container(
                  color: GlobalVariables.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: _nameController,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AppTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomButton(callback: () {}, label: 'Sign In'),
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
}
