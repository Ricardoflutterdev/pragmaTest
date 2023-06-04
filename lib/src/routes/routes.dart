import 'package:flutter/material.dart';

import 'package:test_pragma/src/pages/landing.dart';
import 'package:test_pragma/src/pages/detail.dart';
import 'package:test_pragma/src/pages/splash.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "splash": (BuildContext context) => const Splash(),
    "landing": (BuildContext context) => const Landing(),
    "detail": (BuildContext context) => const Detail(),
  };
}
