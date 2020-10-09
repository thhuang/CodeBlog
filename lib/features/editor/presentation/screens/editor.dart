import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zefyr/zefyr.dart';

import '../logicholders/editor_change_notifier.dart';

class Editor extends StatefulWidget {
  Editor({Key key}) : super(key: key);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final ZefyrController _controller = ZefyrController(NotusDocument());
  final FocusNode _focusNode = FocusNode();
  StreamSubscription<NotusChange> _sub;

  @override
  void initState() {
    super.initState();
    _sub = _controller.document.changes.listen((_) {});
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Color(0xFF2E323B),
            child: Consumer<EditorChangeNotifier>(
              builder: (_, editor, __) {
                _sub.onData((_) {
                  editor.data = _controller.document.toPlainText();
                });
                return ZefyrScaffold(
                  child: ZefyrEditor(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    controller: _controller,
                    focusNode: _focusNode,
                    withToolbar: false,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EditorBak extends StatelessWidget {
  const EditorBak({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Color(0xFF2E323B),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Consumer<EditorChangeNotifier>(
                builder: (_, editor, __) => TextField(
                  style: textTheme.bodyText2.apply(fontSizeDelta: 3),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '# This will be the title of your document',
                  ),
                  onChanged: (data) => editor.data = data,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
