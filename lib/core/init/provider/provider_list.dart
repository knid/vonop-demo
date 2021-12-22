import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './page_provider.dart';

class ApplicationProvider {
  static List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => PageProvider(),
    ),
  ];
}
