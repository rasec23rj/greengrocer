import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/models/item_model.dart';

class QuantityComponents extends StatefulWidget {
  final ItemModel itemModel;
  final VoidCallback adicionar;
  final VoidCallback remover;
  final int quantidade;
  const QuantityComponents({
    super.key,
    required this.itemModel,
    required this.adicionar,
    required this.remover,
    required this.quantidade,
  });

  @override
  State<QuantityComponents> createState() => _QuantityComponentsState();
}

class _QuantityComponentsState extends State<QuantityComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _qauntity_components(
            icon: widget.quantidade == 0
                ? Icons.delete_forever_outlined
                : Icons.remove,
            onTap: () => widget.remover(),
            color: ColorsTheme.customContrastColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("${widget.quantidade} ${widget.itemModel.unit}"),
          ),
          _qauntity_components(
            icon: Icons.add,
            onTap: () => widget.adicionar(),
            color: ColorsTheme.customSwatchColor,
          ),
        ],
      ),
    );
  }
}

class _qauntity_components extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const _qauntity_components({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 15),
        ),
      ),
    );
  }
}
