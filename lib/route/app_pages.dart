import 'package:edd_life/modules/add_order/add_order.dart';
import 'package:edd_life/modules/auth/auth.dart';
import 'package:edd_life/modules/home/home.dart';
import 'package:edd_life/modules/order/order.dart';
import 'package:edd_life/route/app_routes.dart';
import 'package:flutter/material.dart';

abstract class AppPages {
  static final Map<String, WidgetBuilder> pages = {
    AppRoutes.initPage: (_) => const AuthView(),
    AppRoutes.homePage: (_) => const HomeView(),
    AppRoutes.orderPage: (_) => const OrderPage(),
    AppRoutes.addOrderPage: (_) => const AddOrderPage()
  };
}
