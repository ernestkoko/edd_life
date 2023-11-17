import 'package:edd_life/modules/order/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Status"),
      ),
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 2),
          child: Center(
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                final orderMessages = context.read<OrderBloc>().orderMessages;
                return ListView(
                  children: List.generate(
                    orderMessages.length,
                    (i) => Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        children: [
                          Text(orderMessages[i].eventName!),
                          Text("${orderMessages[i].order!.quantity!}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
