import 'package:flutter/material.dart';

class ErrorGeo extends StatelessWidget {
  final String error;
  const ErrorGeo({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
