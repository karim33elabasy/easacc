import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  const AppIconButton({super.key, required this.text, required this.icon, required this.onPressed, this.color, this.textColor, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isLoading?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: textColor?? Colors.grey,
              strokeWidth: 2,
            ),
          ),
          SizedBox(width: 10,),
          Text("Loading...", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: textColor ?? Colors.grey[800]),)
        ],
      ):InkWell(
        onTap: onPressed,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: textColor?? Colors.grey,),
            SizedBox(width: 10,),
            Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: textColor ?? Colors.grey[800]),)
          ],
        ),
      ),
    );
  }
}
