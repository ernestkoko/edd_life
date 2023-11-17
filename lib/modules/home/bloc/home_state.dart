part of 'home_bloc.dart';

abstract class HomeState extends Equatable{

}
class HomeInitState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  HomeLoadingState({this.loading = false});
  bool loading;
  @override
  List<Object?> get props => [loading];
}

class HomeLoggedOutState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState{
HomeErrorState({this.message ="A glitch happened. try again later."});
  String message;
  @override
  List<Object?> get props => [message];
}