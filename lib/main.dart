import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/user.dart';
import 'package:flutter_widgetbook/screens/signin/signin.dart';
import 'package:flutter_widgetbook/screens/wrapper.dart';
import 'package:flutter_widgetbook/services/auth.dart';
import 'package:provider/provider.dart';
//import 'screens/setup/Setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
        value: AuthService().user,
        initialData: null,
        catchError: (_, err) => null,
        child: MaterialApp(
            theme: ThemeData(
              brightness: Brightness.dark,
              //primaryColor: Colors.lightBlue[00],
              //backgroundColor: Colors.black,
              fontFamily: 'Georgia',
              //scaffoldBackgroundColor: Color.fromARGB(255, 10, 9, 9)
            ),

            //home: const Wrapper(),
            initialRoute: '/',
            routes: {
              '/': (context) => const Wrapper(),
              '/signin': (context) => const SignIn(),
              //'/scheduleandlocation': (context) => const ScheduleAndLocation(),

              //'/signup': (context) => const Signup(),
            }));
  }
}
