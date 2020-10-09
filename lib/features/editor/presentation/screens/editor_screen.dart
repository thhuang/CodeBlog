import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../logicholders/editor_change_notifier.dart';
import 'displayer.dart';
import 'editor.dart';

class EditorScreen extends StatelessWidget {
  static const String ID = '/';

  const EditorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(MdiIcons.fileTreeOutline),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                  SizedBox(width: 10),
                  Text('CodeBlog'),
                ],
              ),
            ),
            Spacer(),
            for (int i = 0; i < min(3, editorChoices.length); ++i)
              IconButton(
                icon: Icon(editorChoices[i].icon),
                onPressed: () {},
              ),
            Spacer(),
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(MdiIcons.shareVariant),
                    onPressed: () => null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChangeNotifierProvider<EditorChangeNotifier>(
              create: (_) => EditorChangeNotifier(),
              child: Row(
                children: [
                  Expanded(child: Editor()),
                  Expanded(child: Displayer()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
