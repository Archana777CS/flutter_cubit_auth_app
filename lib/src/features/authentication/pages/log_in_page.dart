import 'package:cubit_registration_app/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:cubit_registration_app/src/features/authentication/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LogIn",
        ),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            BlocConsumer<AuthenticationCubit,AuthenticationState>(
              listener: (context, state) {
                if(state is AuthenticationSuccess){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomePage()));
                }
                else if(state is AuthenticationError){
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().login(
                          _usernameController.text, _passwordController.text);
                    },
                    child: const Text("LOGIN"));
              },
            )

          ],
        ),
      ),

    );

  }
}
