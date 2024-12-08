import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class EventCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int total;
  final String buttonText;

  const EventCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.total,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    // Dynamically adjust sizes based on screen size
    final titleFontSize = isMobile ? 14.0 : isTablet ? 16.0 : 18.0;
    final iconSize = isMobile ? 16.0 : isTablet ? 20.0 : 24.0;
    final avatarRadius = isMobile ? 16.0 : 18.0;
    final buttonPadding = isMobile ? 6.0 : 8.0;

    return Container(
      padding: EdgeInsets.all(isMobile ? 12.0 : 10.0),
      decoration: BoxDecoration(
        color: Colors.purple.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title with icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: iconSize),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
              Icon(Icons.star, color: Colors.yellow, size: iconSize),
            ],
          ),
          SizedBox(height: isMobile ? 20 : 40),
          // User avatars and total count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.grey.shade700,
                child: Icon(icon, color: Colors.white, size: iconSize),
              ),
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.grey.shade700,
                child: Icon(icon, color: Colors.white, size: iconSize),
              ),
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.grey.shade700,
                child: Icon(icon, color: Colors.white, size: iconSize),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 30 : 50),
          // Total text
          Text(
            "Total: $total",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14.0 : 16.0,
            ),
          ),
          const SizedBox(height: 8),
          // Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.telegram, size: iconSize),
            label: Padding(
              padding: EdgeInsets.all(buttonPadding),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: isMobile ? 12.0 : 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
