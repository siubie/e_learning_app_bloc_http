part of 'authenticated_page_bloc.dart';

@immutable
sealed class AuthenticatedPageEvent {}

//add event to get token
final class GetToken extends AuthenticatedPageEvent {}
