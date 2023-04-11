import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/ui.dart';

final List<SingleChildWidget> mainProviders = [
  ChangeNotifierProvider.value(
    value: UI ()
  ),
  ChangeNotifierProvider.value(
    value: Auth ()
  ),
];