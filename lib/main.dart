import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_xb2/app/app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  return runApp(const App());
}
