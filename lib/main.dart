import 'package:flutter/material.dart';
import 'package:joytix/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //?Agar Close banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //!SIGN UP
              RaisedButton(
                child: Text('SignUp'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      "koala@gmail.com",
                      "yui456",
                      "Hera",
                      ["Romance", "Life", "Games"],
                      "English");

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
              //!SIGN IN
              RaisedButton(
                child: Text('SignIn'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signIn(
                    "koala@gmail.com",
                    "yui456",
                  );
                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
