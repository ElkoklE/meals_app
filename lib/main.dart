import 'package:flutter/material.dart';
import 'package:meals_app_v2/meals_app_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MealsAppV2(),
    ),
  );
}
