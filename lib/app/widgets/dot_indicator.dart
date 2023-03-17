import 'package:flutter/material.dart';

class DotIndicatior extends StatelessWidget {
  const DotIndicatior({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 18 : 8,
      width: 6,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(isActive ? 1 : 0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
