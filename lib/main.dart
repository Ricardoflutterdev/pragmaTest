import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pragma/src/helpers/localstorage.dart';
import 'package:test_pragma/src/pages/splash.dart';
import 'package:test_pragma/src/provider/cat_provider.dart';
import 'package:test_pragma/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CatProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test Pragma',
          routes: getApplicationRoutes(),
          initialRoute: "splash",
        ));
  }
}
