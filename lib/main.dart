import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_flutter/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_auth_flutter/authentication/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authService: FirebaseAuthService(
          authService: FirebaseAuth.instance,
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Auth',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
