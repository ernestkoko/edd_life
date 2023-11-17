part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class OnInitAuthEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class OnSignInAuthEvent extends AuthEvent {
  OnSignInAuthEvent({this.google = false, this.github = false});

  bool google;
  bool github;

  @override
  List<Object?> get props => [google, github];
}
