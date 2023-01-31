import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final double width;

  const CustomBottomNavBar({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.5,
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondary.withAlpha(150),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.message_rounded,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_add_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
