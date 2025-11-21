import 'package:easacc/core/constants/app_colors.dart';
import 'package:easacc/core/utils/app_routes.dart';
import 'package:easacc/core/widgets/app_logo.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:easacc/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.6,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 100,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          AppLogo(),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: (){
              Navigator.pushReplacementNamed(context, AppRoutes.kAuthScreen);
              context.read<AuthBloc>().add(LogoutAuthEvent());
            },
          )
        ],
      ),
    );

  }
}
