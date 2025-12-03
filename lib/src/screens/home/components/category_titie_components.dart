import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';

class CategoryTitieComponents extends StatefulWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onPressed;
  const CategoryTitieComponents({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<CategoryTitieComponents> createState() =>
      _CategoryTitieComponentsState();
}

class _CategoryTitieComponentsState extends State<CategoryTitieComponents> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? ColorsTheme.customSwatchColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.category,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: widget.isSelected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
