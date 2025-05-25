import 'package:flutter/material.dart';

bool getCurrentBrightness(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}
