import 'package:e_commerce_flutter/provider/login_provider.dart';
import 'package:e_commerce_flutter/provider/sign_up_provider.dart';
import 'package:e_commerce_flutter/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
              ChangeNotifierProvider<SignUpProvider>(
                lazy: true,
                create: (BuildContext createContext) => SignUpProvider(),
              ),
              ChangeNotifierProvider<LoginProvider>(
                lazy: true,
                create: (BuildContext createContext) => LoginProvider(),
              ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            
          ),
          home: SignUpPage(),
        ),
    );
  }
}
