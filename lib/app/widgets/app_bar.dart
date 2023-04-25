import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(40, 40),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: const Icon(
            PhosphorIcons.list,
            size: 20,
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Icon(
                PhosphorIcons.bell,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/onboarding_one.png")),
          ],
        )
      ],
    );
  }
}
