import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Controllers/userController.dart';
import 'package:testproject/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// ساخت کنترلر برای کنترل کردن مقدار های وارد شده در ورودی ها
  var userController = TextEditingController();

  var passwordController = TextEditingController();

  var uController = UserController();
  var message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'kharazmi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 20.0),
              child: Text(
                'Welcome to my App \nPlease Login to use App ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                maxLength: 8,
                controller: userController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'User name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                maxLength: 8,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilledButton(
                onPressed: () {
                  var username = userController.text;
                  var password = passwordController.text;
                  if (uController.login(username, password)) {
                    Get.off(HomePage());
                  }
                },
                child: const Text("Login"),
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(14.0)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
              ),
            ),
            Text(
              message,
              style: TextStyle(fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Dont Have Account? Signup'),
            )
          ],
        ),
      ),
    );
  }
}
