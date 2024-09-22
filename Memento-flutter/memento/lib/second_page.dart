import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String text;
  const SecondPage({required this.text, super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second page")),
      body: Center(child: Text("Entered: ${widget.text}")),
    );
  }
}
