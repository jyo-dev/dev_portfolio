import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HoverBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) builder;

  const HoverBuilder({super.key, required this.builder});

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  void _onEnter(PointerEnterEvent event) => setState(() => _isHovered = true);
  void _onExit(PointerExitEvent event) => setState(() => _isHovered = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: widget.builder(context, _isHovered),
    );
  }
}
