import 'package:flutter/material.dart';

abstract class SnackBarServices {
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey => _scaffoldMessengerKey;

  /// Shows a basic snackbar with custom content
  static void show({
    required Widget content,
    Duration duration = const Duration(seconds: 4),
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    Color? backgroundColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    DismissDirection dismissDirection = DismissDirection.down,
    Animation<double>? animation,
    VoidCallback? onVisible,
  }) {
    _removeCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: content,
        duration: duration,
        behavior: behavior,
        backgroundColor: backgroundColor,
        margin: margin,
        padding: padding,
        shape: shape,
        dismissDirection: dismissDirection,
        animation: animation,
        onVisible: onVisible,
      ),
    );
  }

  /// Shows a success snackbar
  static void success({
    required String message,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
  }) {
    _showThemedSnackBar(
      message,
      duration,
      icon ?? const Icon(Icons.check_circle, color: Colors.white),
      Colors.green,
    );
  }

  /// Shows an error snackbar
  static void error({
    required String message,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
  }) {
    _showThemedSnackBar(
      message,
      duration,
      icon ?? const Icon(Icons.error, color: Colors.white),
      Colors.redAccent,
    );
  }

  /// Shows a warning snackbar
  static void warning({
    required String message,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
  }) {
    _showThemedSnackBar(
      message,
      duration,
      icon ?? const Icon(Icons.warning_amber, color: Colors.white),
      Colors.orange,
    );
  }

  /// Shows an info snackbar
  static void info({
    required String message,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
  }) {
    _showThemedSnackBar(
      message,
      duration,
      icon ?? const Icon(Icons.info, color: Colors.white),
      Colors.blue,
    );
  }

  /// Shows a snackbar with action button
  static void withAction({
    required String message,
    required String actionLabel,
    required VoidCallback onActionPressed,
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    Color? actionTextColor,
  }) {
    _removeCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: backgroundColor,
        action: SnackBarAction(
          label: actionLabel,
          onPressed: onActionPressed,
          textColor: actionTextColor ?? Colors.white,
        ),
      ),
    );
  }

  /// Private method to show themed snackbars
  static void _showThemedSnackBar(
      String message,
      Duration duration,
      Widget icon,
      Color backgroundColor,
      ) {
    _removeCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// Removes current snackbar if any
  static void _removeCurrentSnackBar() {
    _scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
  }
}