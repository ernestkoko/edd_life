import 'dart:developer';

import 'package:edd_life/modules/add_order/add_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderPage extends StatelessWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: Container(
        child: ListView(
          children: [
            BlocBuilder<AddOrderBloc, AddOrderState>(builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    log("MAIN");
                    if(state is AddOrderInitState) {
                      log(state.index.toString());
                    }
                    if (state is AddOrderInitState && state.index == -1) return;
                    context.read<AddOrderBloc>().add(OnAddOrderEvent(
                        index: state is AddOrderInitState ? state.index : 0,
                        name: "hhh"));
                  },
                  child: Text("Add order"));
            })
          ],
        ),
      ),
    );
  }
}
