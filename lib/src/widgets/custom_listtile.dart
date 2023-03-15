import 'package:flutter/material.dart';

class CustomListTile extends ListTile {
  final int index;
  final void Function(int) onPressed;

  CustomListTile({
    required this.index,
    required this.onPressed,
    required String title,
    String? subtitle,
    Widget? trailing,
  }) : super(
    title: Text(title),
    subtitle: subtitle != null ? Text(subtitle) : null,
    trailing: trailing,
    onTap: () => onPressed(index),
  );
}
