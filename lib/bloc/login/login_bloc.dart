import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/data/response/login_response/login_response.dart';
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
        //add 3 second delay
        emit(LoginInProgress());
        await Future.delayed(const Duration(seconds: 3));
        //add checking to apiRepository authenticate
        try {
          final response = await apiRepository.authenticate(
              event.identifier, event.password);
          //set token to shared preferences
          await apiRepository.saveTokenToPrefs(
            response.jwt.toString(),
          );
          //add state for LoginSuccess
          emit(LoginSuccess(response));
        } catch (e) {
          //add state for LoginFailed
          emit(LoginFailed(e.toString()));
        }
      }
    });
  }
}
