import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(title: 'Flutter Scaner'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  var buttonLoginStyle = ElevatedButton.styleFrom(
    primary: Colors.white38,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/title_app.png',
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonLoginQR(buttonLoginStyle: buttonLoginStyle),
            SizedBox(height: 30),
            ButtonLoginManually(buttonLoginStyle: buttonLoginStyle),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}

class ButtonLoginQR extends StatelessWidget {
  const ButtonLoginQR({
    Key? key,
    required this.buttonLoginStyle,
    String? text,
  }) : super(key: key);

  final ButtonStyle buttonLoginStyle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350.0,
        minHeight: 45,
      ),
      child: ElevatedButton(
        child: Text(
          'LOGIN WITH QR',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Button',
            color: Colors.black,
          ),
        ),
        style: buttonLoginStyle,
        onPressed: () {},
      ),
    );
  }
}

class ButtonLoginManually extends StatelessWidget {
  const ButtonLoginManually({
    Key? key,
    required this.buttonLoginStyle,
  }) : super(key: key);

  final ButtonStyle buttonLoginStyle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350.0,
        minHeight: 45,
      ),
      child: ElevatedButton(
        child: Text(
          'LOGIN WITH MANUALLY',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Button',
            color: Colors.black,
          ),
        ),
        style: buttonLoginStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
          timeDilation = 2.0;
        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manual login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50.0,
              ),
              child: Column(
                children: [
                  LoginUsername(),
                  Loginpassword(),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      ),
                    ),
                    child: Text('Login'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginUsername extends StatelessWidget {
  const LoginUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Enter your username',
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class Loginpassword extends StatelessWidget {
  const Loginpassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Enter your password',
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        obscureText: true,
      ),
    );
  }
}