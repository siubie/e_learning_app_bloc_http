import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository apiRepository;
  LoginBloc(this.apiRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // Add 'async' keyword here
      //add event handler for LoginButtonPressed
      if (event is LoginButtonPressed) {
        //add state for LoginInProgress
        emit(LoginInProgress());
        //add checking to apiRepository authenticate
        try {
          final message = await apiRepository.authenticate(
              event.identifier, event.password);
          //add state for LoginSuccess
          emit(LoginSuccess(message));
        } catch (e) {
          //add state for LoginFailed
          emit(LoginFailed(e.toString()));
        }
      }
    });
  }
}
