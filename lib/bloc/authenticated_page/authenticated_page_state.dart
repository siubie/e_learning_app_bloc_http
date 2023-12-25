part of 'authenticated_page_bloc.dart';

@immutable
sealed class AuthenticatedPageState {}

final class AuthenticatedPageInitial extends AuthenticatedPageState {}

//add state for loading authenticated page
final class AuthenticatedPageLoading extends AuthenticatedPageState {}

//add state for authenticated page success
final class AuthenticatedPageSuccess extends AuthenticatedPageState {
  final String message;
  AuthenticatedPageSuccess(this.message);
}

//add state for authenticated page failed
final class AuthenticatedPageFailed extends AuthenticatedPageState {
  final String message;
  AuthenticatedPageFailed(this.message);
}
