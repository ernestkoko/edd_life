import 'dart:developer';

import 'package:edd_life/model/auth_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/auth_provider.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState()) {
    on<OnInitAuthEvent>(_onInit);
    on<OnSignInAuthEvent>(_onSignIn);
  }

  Future _onInit(OnInitAuthEvent event, Emitter<AuthState> emit) async {}

  Future _onSignIn(OnSignInAuthEvent event, Emitter<AuthState> emit) async {
    try {
      late AuthUser user;
      if (event.google) {
        emit(AuthLoadingState(google: true, loading: true));
         user = await AppAuthProvider.signInWithGoogle();
        log("CREDENTIALS");
        log(user.email);
        log(user.name);
        log(user.imageUrl);
        log(user.uuid);

      } else if (event.github) {
        emit(AuthLoadingState(github: true, loading: true));
        user = await AppAuthProvider.signInWithGithub();
      }
      emit(AuthSignedInState(authUser: user));
    } on FirebaseAuthException catch (e) {
      log('Firebase auth exception');
      emit(AuthErrorState(message: e.message!));
    } on FirebaseException catch (e) {
      log('Firebase  exception');
      emit(AuthErrorState(message: e.message!));
    } on PlatformException catch (e) {
      log('Platform exception:');
      log(e.code);
      emit(AuthErrorState(message: e.message!));
    } catch (e) {
      log('General exception');
      log(e.toString());
      emit(AuthErrorState());
    } finally {
      emit(AuthLoadingState(loading: false));
    }
  }
}
