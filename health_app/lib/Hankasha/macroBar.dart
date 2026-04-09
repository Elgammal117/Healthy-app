import 'package:flutter/material.dart';

Widget macroBar(String name, int value, int total) {
  final double progress = total > 0 ? (value / total).clamp(0.0, 1.0) : 0.0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(
            "${value.toInt()}g / ${total.toInt()}g",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),

      const SizedBox(height: 6),

      ClipRRect(
        borderRadius: BorderRadius.circular(10),

        child: LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: Colors.grey.shade200,
          color: const Color(0xff13EC80),
        ),
      ),
    ],
  );
}
