import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'core/constants/app_routes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/welcome',
        name: AppRoutes.welcome,
        builder: (context, state) {
          final email = state.extra as String;
          return WelcomeScreen(email: email);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          repository: context.read<AuthRepository>(),
        ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Auth Demo',
          routerConfig: _router,
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
