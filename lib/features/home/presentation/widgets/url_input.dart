import 'package:flutter/material.dart';

class UrlInput extends StatelessWidget {
  final TextEditingController urlController;

  const UrlInput({super.key, required this.urlController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Web URL to open in WebView",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: urlController,
          decoration: const InputDecoration(
            hintText: "https://example.com",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
