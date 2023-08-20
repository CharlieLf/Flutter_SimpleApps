import 'package:flutter/material.dart';
import 'package:flutterqualif/func/alphanumeric_func.dart';
import 'package:flutterqualif/func/navigate_func.dart';
import 'package:flutterqualif/func/snackbar_func.dart';
import 'package:flutterqualif/pages/nav_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Login Page"),
          leading: GestureDetector(
            child: ClipOval(
                child: Image.network(
                'https://cdn-image.hipwee.com/wp-content/uploads/2019/03/hipwee-WhatsApp-Image-2019-03-15-at-12.56.46-11-640x639.jpeg',
                
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200, // Set the desired width
              height: 50, // Set the desired height
              child: OutlinedButton(
                onPressed: () => handleLogin(
                    context, usernameController, passwordController),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void handleLogin(BuildContext context, TextEditingController usernameController,
    TextEditingController passwordController) {
  String username = usernameController.text;
  String password = passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    showSnackBar(context, "Username or Password must be inputed!");
    return;
  }
  if (password.length < 8) {
    showSnackBar(context, "Password Length Must be more than 8 char");
    return;
  }
  if (!isPasswordAlphanumeric(password)) {
    showSnackBar(context, "Password must be Alpha Numeric Character");
    return;
  }

  navigateWithoutBackButton(context, "LoginSucces", NavigationPage(username: username));
}
