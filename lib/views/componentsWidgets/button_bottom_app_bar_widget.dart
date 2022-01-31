import 'package:flutter/material.dart';

class ButtonBottomAppBarWidget extends StatelessWidget {
  final double width;
  final String imagePath;
  final Function() onTap;
  final bool selected;
  const ButtonBottomAppBarWidget({Key? key, required this.width, required this.imagePath, required this.onTap, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: selected ? width * 0.07 : width * 0.05,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          color: selected ? const Color(0xFF6435ff) : const Color(0xFF908d8d),
        ),
      ),
    );
  }
}
