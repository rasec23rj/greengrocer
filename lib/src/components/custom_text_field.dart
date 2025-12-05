import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Text label;
  final TextInputType? keyboardtype;
  final IconData? icon;
  List<TextInputFormatter>? inputFormatters;
  final bool isSecret;
  final TextEditingController? controller;
  final bool readOnly;
  String? Function(String?)? validator;
  final GlobalKey<FormFieldState>? formFieldkey;

  CustomTextField({
    super.key,
    required this.label,
    this.keyboardtype,
    this.icon,
    this.isSecret = false,
    this.inputFormatters,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.formFieldkey,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: widget.formFieldkey,
          readOnly: widget.readOnly,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: Colors.lightGreen),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: obscureText ? Colors.lightGreen : Colors.red,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            label: widget.label,
          ),
          validator: widget.validator,
          keyboardType: widget.keyboardtype,
          obscureText: obscureText,
          inputFormatters: widget.inputFormatters,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
