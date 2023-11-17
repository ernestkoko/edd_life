import 'dart:async';
import 'dart:developer';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:edd_life/common/enum.dart';
import 'package:edd_life/model/order.dart';

class CustomAblyService {
  CustomAblyService._(this._realtime);

  final ably.Realtime _realtime;

  static CustomAblyService init() {
    log("INIT ABLY");

    /// initialize client options for your Ably account using your private API.

    final ably.ClientOptions clientOptions = ably.ClientOptions(
        key: "KEY");
    final realtime = ably.Realtime(options: clientOptions);

    /// connect the app to Ably's Realtime services supported by this SDK
    realtime.connect().then((value) => {

    });

    return CustomAblyService._(realtime);
  }

  Stream<OrderMessage> getUpdate() async* {
    final controller = StreamController<OrderMessage>();
    ably.RealtimeChannel channel = _realtime.channels.get('order');
    var orderStream = channel.subscribe();
    orderStream.listen((ably.Message message) {
      log('STREAM');

      log(message.toString());
      log(message.data.runtimeType.toString());
      log(message.data.toString());
      controller.add(OrderMessage(
          eventName: message.name,
          order:
              Order.fromMap(Map<String, dynamic>.from(message.data as Map))));
    }).onDone(() {
      controller.close();
    });
    yield* controller.stream;
  }

  Future sendMessage(
      {required Order order, required OrderAblyState eventName}) async {
    ably.RealtimeChannel channel = _realtime.channels.get('order');
    await channel.publish(
        data: order.toMap(), name: convertOrderStateToString(eventName));
  }
}
