import 'package:flutter/material.dart';

class ProjectCardComponents extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive; // Tracks the active status

  const ProjectCardComponents({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? Colors.red[400] : Colors.blue[400], // Card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Slightly smaller corner radius
      ),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12), // Reduced margin
      child: Container(
        width: double.infinity, // Adjust to fill the available width
        padding: EdgeInsets.all(isActive ? 12 : 8), // Reduced padding for smaller size
        child: Row(
          children: [
            // Icon or Image Placeholder
            Container(
              width: 50, // Smaller icon size
              height: 40,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.import_contacts,
                color: Colors.white,
                size: 20, // Smaller icon size
              ),
            ),
            const SizedBox(width: 12), // Reduced spacing between icon and text
            // Project Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isActive ? 14 : 12, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2), // Reduced vertical spacing
                  Row(
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isActive ? 12 : 10, // Adjusted font size
                        ),
                      ),
                      const SizedBox(width: 6), // Reduced spacing
                      const Text(
                        '•',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(width: 6), // Reduced spacing
                      Text(
                        'See project details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isActive ? 10 : 8, // Adjusted font size
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Edit Icon
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 18, // Smaller edit icon
              ),
              onPressed: () {
                // Define the action to be performed when the button is pressed
              },
            )

          ],
        ),
      ),
    );
  }
}
