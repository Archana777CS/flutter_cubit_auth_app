import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  Future<void> login(String username, String password) async {
    emit(AuthenticationLoading());
    await Future.delayed((const Duration(seconds: 20)));
    if (username == "Archana" && password == "12345") {
      emit((AuthenticationSuccess()));
    } else {
      emit(AuthenticationError());
    }
  }
}
