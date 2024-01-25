import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';

class FabElevatedButton extends StatelessWidget {
  final Function() action;
  final String text;
  final double horpadding;
  const FabElevatedButton({super.key, required this.action, required this.text, this.horpadding = 10});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horpadding),
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(AppColors.blue),
          minimumSize: const MaterialStatePropertyAll<Size>(
            Size.fromHeight(
              50,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
