import 'dart:developer';

import 'package:edd_life/modules/home/bloc/provider/home_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    on<OnInitHomeEvent>(_init);
    on<OnLogoutHomeEvent>(_logout);
  }

  Future _init(OnInitHomeEvent event, Emitter<HomeState> emit) async {}

  Future _logout(OnLogoutHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState(loading: true));
      await HomeProvider.logout();
      emit(HomeLoggedOutState());
    } on FirebaseAuthException catch (e) {
      log('Firebase auth exception');
      emit(HomeErrorState(message: e.message!));
    } on FirebaseException catch (e) {
      log('Firebase  exception');
      emit(HomeErrorState(message: e.message!));
    } on PlatformException catch (e) {
      log('Platform exception:');
      log(e.code);
      emit(HomeErrorState(message: e.message!));
    } catch (e) {
      log('General exception');
      log(e.toString());
      emit(HomeErrorState());
    } finally {
      emit(HomeLoadingState(loading: false));
    }
  }
}
