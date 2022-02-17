import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'form/form_provider.dart';
import 'page/page_provider.dart';

class ApplicationProvider {
  static final List<SingleChildWidget> _dependItems = [
    ChangeNotifierProvider(create: (context) => PageProvider()),
    ChangeNotifierProvider(create: (context) => FormProvider()),
  ];
  static get dependItems => _dependItems;
}
