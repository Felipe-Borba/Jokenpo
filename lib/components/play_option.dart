import 'package:flutter/material.dart';

class PlayOption extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onTap;

  const PlayOption({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          foregroundImage: imagePath != null ? AssetImage(imagePath!) : null,
        ),
      ),
    );
  }
}
