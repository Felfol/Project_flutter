import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_flutter/Api/Api_connection.dart';
import 'package:project_flutter/model/user.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key,this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool registrationSuccess=false;
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  validateUserEmail() async {
    try{
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email':emailController.text.trim(),
        },
      );
      if(res.statusCode == 200){
       var resBodyOfValidateEmail = jsonDecode(res.body);
       if(resBodyOfValidateEmail['emailFound'] == true){
         Fluttertoast.showToast(msg: "Email is already in use,Try another email");
       }else{
         registerAndSaveUserRecord();


       }
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Error");

    }
  }



  registerAndSaveUserRecord() async{
  User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
   );
  try {
    var res = await http.post(
      Uri.parse(API.signUp),
      body: userModel.toJson(),
    );
    if (res.statusCode == 200) {
      var resBodyOfSignup = jsonDecode(res.body);
      if (resBodyOfSignup['success'] == true) {
        Fluttertoast.showToast(msg: "SignUp Successfully.");
        setState(() {
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          registrationSuccess = true;
        });
        navigateToLoginPage();

      } else {
        Fluttertoast.showToast(msg: "Error during signup: ${resBodyOfSignup['error']}");
      }
    } else {
      Fluttertoast.showToast(msg: "HTTP Error during signup: ${res.statusCode}");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Error during signup: $e");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),


                Image.asset(
                  'lib/images/unlock.png',
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50),

                Text(
                  'Let\'s create an account for you',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                MyTextField(
                  controller: nameController,
                  hintText: 'username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),


                MyButton(
                  onTap: (){
                    if (passwordController.text == confirmPasswordController.text) {
                      validateUserEmail();
                    } else {
                      Fluttertoast.showToast(msg: "Passwords do not match");
                    }
                  },
                  text: "Sign Up",
                ),

                const SizedBox(height: 50),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
