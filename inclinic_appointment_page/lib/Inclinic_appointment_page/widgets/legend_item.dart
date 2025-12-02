import 'package:flutter/material.dart';


class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final Color? borderColor;
  final Color? textColor;

  const LegendItem({
    Key? key,
    required this.color,
    required this.text,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 2)
                : null,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black, fontSize: 15),
        ),
      ],
    );
  }
}
