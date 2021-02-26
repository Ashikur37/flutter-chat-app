import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool auth = false;
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        if (account != null) {
          print(account);
          setState(() {
            auth = true;
          });
        } else {
          setState(() {
            auth = false;
          });
        }
      },
    );
  }

  login() {
    googleSignIn.signIn();
  }

  buildAuthScreen() {
    return Text("authenticated");
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal,
              Colors.purple,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "BD-Chat",
              style: TextStyle(
                fontSize: 90.0,
                color: Colors.white,
                fontFamily: "signatra",
              ),
            ),
            GestureDetector(
              onTap: () => login(),
              child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/google_signin_button.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return auth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
