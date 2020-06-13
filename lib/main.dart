import 'package:flutter/material.dart';
import 'package:joytix/services/services.dart';
import 'package:joytix/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
          child: MaterialApp(
        //?Agar Close banner
        debugShowCheckedModeBanner: false,
        home: Wrapper()
      ),
    );
  }
}
