import 'package:edd_life/asset/images.dart';
import 'package:edd_life/modules/auth/auth.dart';
import 'package:edd_life/route/app_routes.dart';
import 'package:edd_life/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 2),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return AppButton(
                  text: 'Google',
                  asset: AppImages.google,
                  loading: state is AuthLoadingState && state.google == true
                      ? true
                      : false,
                  onPressed: () {
                    if (state is AuthLoadingState && state.loading ==true) return;
                    context
                        .read<AuthBloc>()
                        .add(OnSignInAuthEvent(google: true));
                  },
                );
              }),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return AppButton(
                  text: 'Github',
                  asset: AppImages.github,
                  loading: state is AuthLoadingState && state.github == true
                      ? true
                      : false,
                  onPressed: () {
                    if (state is AuthLoadingState && state.loading ==true) return;
                    context
                        .read<AuthBloc>()
                        .add(OnSignInAuthEvent(github: true));
                  },
                );
              }),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSignedInState) {
                    Navigator.of(context).popAndPushNamed(AppRoutes.homePage,
                        arguments: state.authUser);
                  }
                },
                child: const Text(''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
