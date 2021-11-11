import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: const Text("AuthApp"),),
      body: Center(
        child: ElevatedButton(child: const Text('Sign Out'),
        onPressed: ()=>BlocProvider.of<AuthCubit>(context).signOut(),
        ),
        )
    );
  }
}
