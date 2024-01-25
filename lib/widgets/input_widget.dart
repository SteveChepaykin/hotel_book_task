import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';

class Input extends StatelessWidget {
  final Function(String)? change;
  final TextEditingController controller;
  final String label;
  const Input(this.label, this.controller, {super.key, this.change, });

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            onChanged: change,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: const TextStyle(
                color: AppColors.chpFG,
              ),
            ),
          ),
        ),
      );
  }
}