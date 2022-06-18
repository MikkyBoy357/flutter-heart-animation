import 'package:flutter/material.dart';
import 'package:heart_animation/providers/HeartProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => HeartProvider()),
];
