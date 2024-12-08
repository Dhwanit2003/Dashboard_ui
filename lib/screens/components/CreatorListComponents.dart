import 'package:flutter/material.dart';

class CreatorListComponents extends StatelessWidget {
  final String name;
  final String artwork;
  final double ratings;

  const CreatorListComponents({
    Key? key,
    required this.name,
    required this.artwork,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Avatar + Name
          Expanded(
            flex: 3,
            child: Row(
              children: [
                // Profile Picture Placeholder
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey.shade800,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                // Creator Name
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Artworks Count
          Expanded(
            flex: 2,
            child: Text(
              artwork,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Rating Bar
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: ratings / 10, // Normalized to a scale of 0 to 1
              backgroundColor: Colors.grey.shade700,
              color: Colors.purple, // Rating bar color
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
