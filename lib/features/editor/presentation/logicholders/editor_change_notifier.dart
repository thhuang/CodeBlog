import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditorStatus extends Equatable {
  const EditorStatus({this.title, this.icon});

  final String title;
  final IconData icon;

  @override
  List<Object> get props => [title, icon];
}

List<EditorStatus> editorChoices = <EditorStatus>[
  EditorStatus(title: 'editor', icon: MdiIcons.leadPencil),
  EditorStatus(title: 'both', icon: MdiIcons.viewSplitVertical),
  EditorStatus(title: 'displayer', icon: MdiIcons.eyeOutline),
];

class EditorChangeNotifier with ChangeNotifier {
  EditorChangeNotifier();

  String _data = "";

  String get data {
    return _data;
  }

  set data(String newData) {
    _data = newData;
    notifyListeners();
  }
}
