
import 'package:flutter/material.dart';
import 'package:youthhealth/constants/theme.dart';

class StrikeThroughTextField extends StatelessWidget {
  final String text;

  const StrikeThroughTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: primaryWhite,
            height: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: primaryGray,
              // backgroundColor: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: primaryWhite,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
