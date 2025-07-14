import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    /// Initialize controllers
    _initControllers();
  }

  /// Initialize controllers
  void _initControllers() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    /// Clear the controllers
    _userNameController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, state) {
          if (state is SignInStatusState) {
            if (state.isSignedIn) {
              /// Navigate to weather_forecast
              _navigateToDashboard(message: '$kWelcomeBack ${state.userName}');
            }
          } else if (state is SignInSuccessState) {
            /// Navigate to weather_forecast
            _navigateToDashboard(message: kLoginSuccess);
          } else if (state is SignInErrorState) {
            /// Show Error Toast
            Utils.showToast(state.error);
          }
        },
        builder: (BuildContext context, state) {
          if (state is AuthLoadingState) {
            return const CustomCircularIndicator();
          } else if ((state is SignInStatusState && !state.isSignedIn) ||
              state is SignInErrorState) {
            return SignInWidget(
              userNameController: _userNameController,
              passwordController: _passwordController,
              signIn: _signIn,
            );
          }
          return const Empty();
        },
      ),
    );
  }

  void _navigateToDashboard({required String message}) {
    /// Show Toast
    Utils.showToast(message);

    /// Navigate to weather_forecast
    AppNavigator.replace(kWeatherForecast);
  }

  void _signIn() {
    if (_userNameController.text.isEmpty || _passwordController.text.isEmpty) {
      Utils.showToast(kEmptyCredentials);
      return;
    }
    context.read<AuthBloc>().add(
      SignInEvent(
        email: _userNameController.text,
        password: _passwordController.text,
      ),
    );
  }
}
