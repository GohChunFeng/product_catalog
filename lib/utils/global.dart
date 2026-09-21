// global key, use when there is no context available, material app have the navigator key property
import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> appNavKey = GlobalKey<NavigatorState>();
// global context, avoid using outside of runApp(), it is not initialize at that point
BuildContext get appContext => appNavKey.currentContext!;
// global state, avoid using outside of runApp(), it is not initialize at that point
NavigatorState get appNavState => appNavKey.currentState!;
