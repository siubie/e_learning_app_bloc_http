import 'package:bloc/bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'authenticated_page_event.dart';
part 'authenticated_page_state.dart';

class AuthenticatedPageBloc
    extends Bloc<AuthenticatedPageEvent, AuthenticatedPageState> {
  final ApiRepository apiRepository;
  AuthenticatedPageBloc(this.apiRepository)
      : super(AuthenticatedPageInitial()) {
    on<AuthenticatedPageEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetToken) {
        //emit state for AuthenticatedPageLoading
        emit(AuthenticatedPageLoading());
        //get token from shared preferences
        final token = await apiRepository.getTokenFromPrefs();
        //chek if token is not null
        if (token != null) {
          //add state for AuthenticatedPageSuccess
          emit(AuthenticatedPageSuccess(token.toString()));
        } else {
          //add state for AuthenticatedPageFailed
          emit(AuthenticatedPageFailed('Token is null'));
        }
      }
    });
  }
}
