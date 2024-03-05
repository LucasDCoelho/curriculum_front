import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObserverCard extends StatefulWidget {
  final String nome;
  final String nomeProficiencia;
  final void Function()? onPressed;
  final Widget icon;

  const ObserverCard({super.key, required this.nome, required this.nomeProficiencia, this.onPressed, required this.icon});

  @override
  State<ObserverCard> createState() => _ObserverCardState();
}

class _ObserverCardState extends State<ObserverCard> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        child: Row(
          children: [
            Text(widget.nome),
            Text(widget.nomeProficiencia),
            IconButton(
              onPressed: widget.onPressed,
              icon: widget.icon,
            ),
          ],),
      ),
    );
  }
}