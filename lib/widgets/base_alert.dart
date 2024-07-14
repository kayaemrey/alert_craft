import 'package:flutter/material.dart';

abstract class BaseAlert {
  final int type;
  final String title;
  final String description;
  final Color? backgroundColor;
  BaseAlert({required this.type,required this.title,required this.description,required this.backgroundColor});
}
