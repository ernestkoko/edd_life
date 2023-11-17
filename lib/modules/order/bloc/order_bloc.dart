import 'dart:async';
import 'dart:developer';

import 'package:edd_life/common/enum.dart';
import 'package:edd_life/model/order.dart';
import 'package:edd_life/service/ably/ably_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._ablyService) : super(OrderInitState()) {
    _ablyService!.getUpdate().listen((orderMessage) {
      log('LISTENING');
      add(OnAddOrderEvent(orderMessage: orderMessage));
    });
    on<OnInitOrderEvent>(_onInit);
    on<OnAddOrderEvent>(_onAddOrder);
  }

  CustomAblyService? _ablyService;

  List<OrderMessage> orderMessages = [];

  bool _init = false;

  Future _onInit(OnInitOrderEvent event, Emitter<OrderState> emit) async {

    if(_init) return;

    final order = Order();
    order.price = 200;
    order.quantity = 2;
    order.item = "Item1";
    order.date = DateTime.now().toString();
    await _ablyService?.sendMessage(
        order: order, eventName: OrderAblyState.orderPlaced);
  }

  Future _onAddOrder(OnAddOrderEvent event, Emitter<OrderState> emit) async {
    _init = true;
    log('ADD ORDER EVENT');

    orderMessages.add(event.orderMessage);
    emit(OrderAddState(orderMessage: event.orderMessage));
  }
}
