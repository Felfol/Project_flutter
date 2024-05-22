import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_flutter/Api/Api_connection.dart';
import 'package:project_flutter/model/user.dart';
import 'package:project_flutter/model/user_prefrences.dart';
import 'package:project_flutter/pages/register_page.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/my_square_tile.dart';
import '../theme/theme_provider.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key,this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   loginUserNow() async{
     try{
     var res = await http.post(
       Uri.parse(API.login),
       body: {
         'user_email':emailController.text.trim(),
         'user_password':passwordController.text.trim(),
       },
     );
     if (res.statusCode == 200) {
       var resBodyOfLogin = jsonDecode(res.body);
       if (resBodyOfLogin['success'] == true) {
         Fluttertoast.showToast(msg: "Login Successfully.");
        User userInfo = User.fromJson(resBodyOfLogin["userData"]);
         print(resBodyOfLogin.runtimeType);
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) =>  HomePage(),
           ),
         );
         await RememberUserPrefs.saveRememberUser(userInfo);

       } else {
         Fluttertoast.showToast(msg: "Incorrect credentials,please Try again");

       }
     } else {
       Fluttertoast.showToast(msg: "HTTP Error during signup: ${res.statusCode}");
     }
   } catch (e) {
  Fluttertoast.showToast(msg: "Error during signup: $e");
  }
   }




  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password."),
      ),
    );
  }


  void googleSignIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Login with Google?"),
        actions: [
          // cancel
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),


          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomePage(),
              ),
            ),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }


  void appleSignIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Login with Apple?"),
        actions: [

          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),


          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomePage(),
              ),
            ),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
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
                const SizedBox(height: 30),


                Image.asset(
                  'lib/images/unlock.png',
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 30),


                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),


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


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: forgotPw,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),


                MyButton(
                  onTap: (){
                    loginUserNow();
                  },
                  text: "Login",
                ),

                const SizedBox(height: 25),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SquareTile(
                      onTap: googleSignIn,
                      child: Image.asset(
                        'lib/images/google.png',
                        height: 25,
                      ),
                    ),

                    const SizedBox(width: 25),


                    SquareTile(
                      onTap: appleSignIn,
                      child: Image.asset(
                        'lib/images/apple.png',
                        height: 25,
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
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
