part of 'add_order_bloc.dart';

abstract class AddOrderState extends Equatable{}
class AddOrderInitState extends AddOrderState{
  AddOrderInitState({required this.index});
  int index;
  @override
  List<Object?> get props => [index];
}