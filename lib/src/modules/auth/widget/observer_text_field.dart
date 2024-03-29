import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObserverTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? errorText;
  final bool enabled;
  final List<TextInputFormatter>? mask;

  const ObserverTextField({
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    this.enabled = true,
    this.errorText,
    this.mask,
    super.key
      });

  @override
  State<ObserverTextField> createState() => _ObserverTextFieldState();
}

class _ObserverTextFieldState extends State<ObserverTextField> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextField(
          onChanged: widget.onChanged,
          obscureText: widget.obscureText,
          inputFormatters: widget.mask,
          decoration: InputDecoration(
            enabled: widget.enabled,
            border: const OutlineInputBorder(),
            labelText: widget.labelText,
            hintText: widget.hintText,
            errorText: widget.errorText
          )),
    );
  }
}
