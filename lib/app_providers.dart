import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc/core/utils/services_locator.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'app.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthBloc(googleLoginUseCase: getIt(), facebookLoginUseCase: getIt(), supabaseClient: getIt()),),
      ],
      child: App(),
    );
  }
}
