part of 'order_bloc.dart';

abstract class OrderState extends Equatable{

}

class OrderInitState extends OrderState{
  @override
  List<Object?> get props => [];

}

class OrderAddState extends OrderState{
  OrderAddState({required this.orderMessage});
  OrderMessage orderMessage;
  @override
  List<Object?> get props => [orderMessage];
}