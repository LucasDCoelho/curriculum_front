import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObserverButton extends StatefulWidget {
  final Future Function()? onPressed;
  final ButtonStyle? style;
  final Widget? child;

  const ObserverButton({
    required this.onPressed,
    required this.child,
    this.style,
    super.key, 
  });

  @override
  State<ObserverButton> createState() => _ObserverButtonState();
}

class _ObserverButtonState extends State<ObserverButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ElevatedButton(
          onPressed: widget.onPressed,
          style: widget.style,
          child: widget.child
      ),
    );
  }
}
