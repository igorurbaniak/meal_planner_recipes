import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remember to'),
      ),
      body: const Center(child: Text('Add here: notifications, language, dark mode')),
    );
  }
}
