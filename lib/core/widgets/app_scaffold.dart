import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? drawer;
  final FloatingActionButton? floatingActionButton;
  const AppScaffold({super.key, required this.body, this.appBar, this.floatingActionButton, this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      backgroundColor: Theme.of(context).brightness == Brightness.light? Colors.grey[200] : Colors.grey[900],
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            appBar ?? const SizedBox(),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
