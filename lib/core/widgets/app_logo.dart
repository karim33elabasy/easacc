import 'package:easacc/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(size != null? size!*0.1 : width*0.03),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FittedBox(
        child: Icon(
          Icons.language,
          color: AppColors.white,
          size: size?? width*0.2,
        ),
      ),
    );
  }
}
