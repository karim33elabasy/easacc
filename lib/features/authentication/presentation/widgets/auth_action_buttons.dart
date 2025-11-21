import 'package:easacc/core/widgets/app_icon_button.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthActionButtons extends StatelessWidget {
  const AuthActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context,state){
      return Column(
        children: [
          AppIconButton(
            text: "Continue With Google",
            icon: Icons.g_mobiledata_outlined,
            onPressed: () {
              context.read<AuthBloc>().add(GoogleLoginAuthEvent());
            },
            isLoading: state is LoadingGoogleAuthState,
          ),
          SizedBox(height: 20,),
          AppIconButton(
            text: "Continue With Facebook",
            icon: Icons.facebook,
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              context.read<AuthBloc>().add(FacebookLoginAuthEvent());
            },
            isLoading: state is LoadingFacebookAuthState,
          ),
        ],
      );
      },
    );
  }
}
