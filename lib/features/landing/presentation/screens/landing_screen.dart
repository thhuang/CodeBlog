import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static const String ID = '/';

  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing'),
      ),
      body: Center(
        child: Text('Landing'),
      ),
    );
  }
}
