import 'package:cubit_registration_app/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:cubit_registration_app/src/features/authentication/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        title: "SnapChat",
        home: BlocProvider(
          create: (_) => AuthenticationCubit(),
          child: const LogInPage(),
        ));
  }
}
