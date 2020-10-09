import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'features/editor/presentation/logicholders/editor_change_notifier.dart';

List<SingleChildWidget> providers = [
  // ...externalServices,
  // ...coreProviders,
  ...featureProviders,
  // ...valueProviders,
];

List<SingleChildWidget> featureProviders = [
  // ...dataSourceProviders,
  // ...repositoryProviders,
  // ...useCaseProviders,
  ...changeNotifierProviders,
];

List<SingleChildWidget> changeNotifierProviders = [
  ChangeNotifierProvider(
    create: (_) => EditorChangeNotifier(),
  ),
];
