import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import 'auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = AuthRepository();

  AuthCubit() : super(UnknownAuthState());

  void signIn() async {
    try {
      final userId = await authRepo.webSignIn();
      if (userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void signOut() async {
    try {
      await authRepo.signOut();
      emit(Unauthenticated());
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void attemptAutoSignIn() async {
    try {
      final userId = await authRepo.attemptAutoSignIn();
      if (userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } on Exception {
      emit(Unauthenticated());
    }
  }
}
