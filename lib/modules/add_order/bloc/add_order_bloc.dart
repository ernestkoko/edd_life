import 'dart:developer';

import 'package:edd_life/common/enum.dart';
import 'package:edd_life/model/order.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/ably/ably_service.dart';

part 'add_order_event.dart';

part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc(this._ablyService) : super(AddOrderInitState(index: 1)) {
    on<OnInitAddOrderEvent>(_onInit);
    on<OnAddOrderEvent>(_onAddOrder);
  }

  CustomAblyService? _ablyService;
  final List<OrderAblyState> _orderList = [
    OrderAblyState.orderPlaced,
    OrderAblyState.orderAccepted,
    OrderAblyState.orderPickupInProgress,
    OrderAblyState.orderOnTheWayToCustomer,
    OrderAblyState.orderArrived,
    OrderAblyState.orderDelivered,
  ];
  int _orderIndex = 0;

  Future _onInit(
      OnInitAddOrderEvent event, Emitter<AddOrderState> emit) async {}

  Future _onAddOrder(OnAddOrderEvent event, Emitter<AddOrderState> emit) async {
    final order = Order();
    order.price = 200;
    order.quantity = 2;
    order.item = event.name;
    order.date = DateTime.now().toString();

    log(_orderList[event.index].toString());
    await _ablyService?.sendMessage(
        order: order, eventName: _orderList[event.index]);
    _orderIndex++;
    log(event.index.toString());
    log(_orderIndex.toString());

    emit(AddOrderInitState(
        index: _orderIndex != _orderList.length ? _orderIndex : -1));
  }
}
