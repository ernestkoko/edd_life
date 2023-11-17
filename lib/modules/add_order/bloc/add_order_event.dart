part of 'add_order_bloc.dart';

abstract class AddOrderEvent extends Equatable {}

class OnInitAddOrderEvent extends AddOrderEvent {
  @override
  List<Object?> get props => [];
}

class OnAddOrderEvent extends AddOrderEvent {
  OnAddOrderEvent({required this.index, required this.name});
  int index;
  String name;
  @override
  List<Object?> get props => [index, name];
}
