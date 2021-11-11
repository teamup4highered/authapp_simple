import 'package:authapp/signout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';
import 'loading_page.dart';
import 'signin_page.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unauthenticated) const MaterialPage(child: SignInPage()),
          if (state is Authenticated) const MaterialPage(child: SignOutPage(),),
          if (state is UnknownAuthState) const MaterialPage(child: LoadingPage())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
