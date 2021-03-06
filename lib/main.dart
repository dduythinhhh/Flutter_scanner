import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
      // home: LoginScreen(title: 'Flutter Scanner'),
      home: LoginByManuallyScreen(),
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
            fontFamily: 'Semibold',
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
            fontFamily: 'Semibold',
            color: Colors.black,
          ),
        ),
        style: buttonLoginStyle,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginByManuallyScreen()),
          );
          timeDilation = 2.0;
        },
      ),
    );
  }
}

class LoginByManuallyScreen extends StatelessWidget {
  const LoginByManuallyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.white,
      //   title: Text("Manual login"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_title.png'),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 5.5), // changes position of shadow
                  ),
                ],
              ),
              height: 245,
              width: 320,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  LoginUsername(),
                  SizedBox(height: 10),
                  LoginPassword(),
                  SizedBox(height: 25),
                  Container(
                    alignment: Alignment.center,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 35,
                          width: 75,
                          child: ElevatedButton(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Bold',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScannerScreen(),
                                ),
                              );
                              timeDilation = 2.0;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              '- OR -',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              height: 52,
              width: 320,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  child: Text(
                    'LOGIN WITH QR',
                    style: TextStyle(
                      color: Colors.black,
                      wordSpacing: 1,
                      letterSpacing: 2,
                      fontSize: 21,
                      fontFamily: 'Semibold',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MFS Media & Entertainment'),
                ],
              ),
            )
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
      width: 250,
      child: TextField(
        cursorHeight: 18,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_outlined),
          border: UnderlineInputBorder(),
          labelText: 'Username',
          labelStyle: TextStyle(
            fontSize: 14,
            // fontFamily: "Normal",
          ),
          hintText: 'Enter your usermane',
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class LoginPassword extends StatelessWidget {
  const LoginPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        cursorHeight: 18,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            border: UnderlineInputBorder(),
            labelText: 'Password',
            labelStyle: TextStyle(
              fontSize: 14,
              // fontFamily: "Normal",
            ),
            hintText: 'Enter your password',
            hintStyle: TextStyle(
              fontSize: 14,
            )),
        obscureText: true,
      ),
    );
  }
}

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UNENDING 22 - CHECK TICKET',
              style: TextStyle(
                fontFamily: 'Light',
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            BlockCounter(),
            SizedBox(height: 30),
            ScannerButton(),
          ],
        ),
      ),
    );
  }
}

class BlockCounter extends StatelessWidget {
  const BlockCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlockScaned(),
          SizedBox(width: 45),
          BlockSold(),
        ],
      ),
    );
  }
}

class BlockScaned extends StatelessWidget {
  const BlockScaned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scanned',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Semibold',
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 112,
              minHeight: 52,
            ),
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  '1251',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlockSold extends StatelessWidget {
  const BlockSold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sold',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Semibold',
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 112,
              minHeight: 52,
            ),
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  '1357',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerButton extends StatelessWidget {
  const ScannerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 210,
      child: ClipOval(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Image.asset('assets/images/QR_Button.png'),
              style: TextButton.styleFrom(
                shadowColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
