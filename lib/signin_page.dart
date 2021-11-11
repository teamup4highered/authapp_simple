import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: const Text("AuthApp"),),
      body: Center(
        child: ElevatedButton(child: const Text('Sign In'),
        onPressed: ()=>BlocProvider.of<AuthCubit>(context).signIn(),),
        )
    );
  }
}
