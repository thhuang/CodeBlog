import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../logicholders/editor_change_notifier.dart';

class Displayer extends StatelessWidget {
  const Displayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleSheet = MarkdownStyleSheet.fromTheme(
      theme.copyWith(textTheme: theme.textTheme.apply(fontSizeDelta: 3)),
    );
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: Color(0xFF262A30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Consumer<EditorChangeNotifier>(
                builder: (_, editor, __) => Markdown(
                  styleSheet: styleSheet,
                  data: editor.data,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
