import 'package:edd_life/model/auth_user.dart';
import 'package:edd_life/modules/home/bloc/home_bloc.dart';
import 'package:edd_life/modules/order/bloc/order_bloc.dart';
import 'package:edd_life/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as AuthUser;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.addOrderPage);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return IconButton(
            onPressed: () {
              if (state is HomeLoadingState && state.loading == true) return;
              context.read<HomeBloc>().add(OnLogoutHomeEvent());
            },
            icon: state is HomeLoadingState && state.loading == true
                ? const SizedBox(
                    height: 10, width: 10, child: CircularProgressIndicator())
                : const Text("Logout"),
          );
        }),
      ),
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 2),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  foregroundColor: const Color(0xFFFF5349),
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: ' ${user.name},',
                    style: const TextStyle(
                      color: Colors.brown,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text(user.email),
                TextButton(
                  onPressed: () {
                    // context.read<OrderBloc>().add(OnInitOrderEvent());
                    Navigator.of(context).pushNamed(AppRoutes.orderPage);
                  },
                  child: const Text('Track your order'),
                ),
                BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is HomeErrorState) {}
                    if (state is HomeLoggedOutState) {
                      Navigator.of(context).popAndPushNamed(AppRoutes.initPage);
                    }
                  },
                  child: const Text(''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
