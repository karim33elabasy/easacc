import 'package:easacc/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogo(),
        SizedBox(height: 20,),
        Text("Web View App", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22),),
        SizedBox(height: 15,),
        Text("Sign in to continue", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),)
      ],
    );
  }
}
