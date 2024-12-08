import 'package:flutter/material.dart';
import '../screens/components/CreatorListComponents.dart';

class CreatorListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Background color similar to the image
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,top: 10),
            child: Text(
              "Top Creators",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Header with Divider
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Artworks",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Rating",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white24, // Divider color
                thickness: 1,         // Divider thickness
                height: 16,           // Space around the divider
              ),
            ],
          ),
          // Creators List
          Expanded(
            child: ListView(
              children: const [
                CreatorListComponents(name: "Maddison", artwork: "9821", ratings: 9.8),
                CreatorListComponents(name: "Karl", artwork: "7032", ratings: 7.5),
                CreatorListComponents(name: "Sophia", artwork: "9821", ratings: 9.3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
