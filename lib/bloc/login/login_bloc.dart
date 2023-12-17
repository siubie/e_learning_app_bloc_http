import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async { // Add 'async' keyword here
      //add event handler for LoginButtonPressed
      if (event is LoginButtonPressed) {
        //add state for LoginInProgress
        emit(LoginInProgress());
        //add 3 second delay
        await Future.delayed(const Duration(seconds: 3)); // Add 'await' keyword here
        //add checking to validate the identifier and password
        if (event.identifier == 'dosenNgoding' || event.password == '123456') {
          //add state for LoginFailed
          emit(LoginSuccess('Login Success'));
          return;
        } else {
          //add state for LoginFailed
          emit(LoginFailed('Login Failed'));
          return;
        }
        //add state for LoginSuccess
      }
    });
  }
}
