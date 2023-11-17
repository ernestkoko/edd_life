part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable{}

class OnInitOrderEvent extends OrderEvent{
  @override
  List<Object?> get props => [];

}

class OnAddOrderEvent extends OrderEvent{
  OnAddOrderEvent({ required this.orderMessage});
  OrderMessage orderMessage;
  @override
  List<Object?> get props => [orderMessage];

}