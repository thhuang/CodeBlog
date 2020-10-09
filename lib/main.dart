import 'package:flutter/material.dart';

import 'features/editor/presentation/screens/editor_screen.dart';

void main() => runApp(CodeBlogApp());

class CodeBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeBlog',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'FiraSans'),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ),
        textSelectionColor: Colors.lightBlue[100].withAlpha(50),
        textSelectionHandleColor: Colors.transparent,
      ),
      initialRoute: EditorScreen.ID,
      routes: {
        // LandingScreen.ID: (_) => LandingScreen(),
        EditorScreen.ID: (_) => EditorScreen(),
      },
    );
  }
}
