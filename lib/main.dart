import 'package:flutter/material.dart';
import 'package:week_9/data/users.dart';
import 'package:week_9/screens/formpage.dart';
import 'package:week_9/screens/loginpage.dart';
import 'package:week_9/screens/userpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var newLaunch; //объявляем переменную для загрузкт экрана

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

//функция, которая получает из sharedPreference булевое значение и присваивает его переменной.
// значение изначально false, если галочка remember нажата, то меняется на true.
  loadNewLaunch() async {
    setState(() {
      bool userNewLaunch = UserPreferences().getLaunch() ?? false;
      newLaunch = userNewLaunch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.black26),
      routes: {
        // если newLaunch true, то загружаем  UserPage, в противном случае LoginPage
        '/': (context) => newLaunch ? UserPage(newLaunch) : const LoginPage(),
        '/loginpage': ((context) => const LoginPage()),
        '/formpage': (context) => const FormPage(),
        '/userpage': (context) => UserPage(newLaunch),
      },
    );
  }
}
