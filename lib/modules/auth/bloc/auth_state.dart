part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  AuthLoadingState(
      {this.google = false, this.github = false, this.loading = false});

  bool google;
  bool github;
  bool loading;

  @override
  List<Object?> get props => [google, github, loading];
}

class AuthSignedInState extends AuthState {
  AuthSignedInState({required this.authUser});
  AuthUser authUser;
  @override
  List<Object?> get props => [authUser];
}


class AuthErrorState extends AuthState {
  AuthErrorState({this.message = 'A glitch happened. try again later!'});
  String message;
  @override
  List<Object?> get props => [message];
}
