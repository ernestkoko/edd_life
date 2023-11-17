import 'package:edd_life/firebase_options.dart';
import 'package:edd_life/modules/add_order/add_order.dart';
import 'package:edd_life/modules/auth/auth.dart';
import 'package:edd_life/modules/home/bloc/home_bloc.dart';
import 'package:edd_life/modules/order/bloc/order_bloc.dart';
import 'package:edd_life/route/app_pages.dart';
import 'package:edd_life/route/app_routes.dart';
import 'package:edd_life/service/ably/ably_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc()..add(OnInitAuthEvent()),
        ),
        BlocProvider(
          create: (_) => HomeBloc()..add(OnInitHomeEvent()),
        ),
        BlocProvider(
          create: (_) => OrderBloc(CustomAblyService.init())..add(OnInitOrderEvent()),
        ),
        BlocProvider(
          create: (_) => AddOrderBloc(CustomAblyService.init())..add(OnInitAddOrderEvent()),
        ),
        // BlocProvider(create: (_)=>HomeB)
      ],
      child: MaterialApp(
        title: 'Eden Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        scaffoldMessengerKey: scaffoldMessenger,
        initialRoute: AppRoutes.initPage,
        routes: AppPages.pages,
      ),
    );
  }
}
