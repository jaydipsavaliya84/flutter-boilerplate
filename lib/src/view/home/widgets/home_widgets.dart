import 'package:flutter/material.dart';

Padding commonDataShowView({
  String? title,
  String? description,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 8.0,
      left: 16,
      right: 16,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          description!,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
