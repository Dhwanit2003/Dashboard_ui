import 'package:flutter/material.dart';
import '../screens/components/ProjectCardComponents.dart';

class ProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300 ,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Background color similar to image
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "All Projects",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                ProjectCardComponents(title: "Project 1", subtitle: "Subtitle 1",isActive: true,),
                ProjectCardComponents(title: "Project 2", subtitle: "Subtitle 2",isActive: false,),
                ProjectCardComponents(title: "Project 3", subtitle: "Subtitle 3",isActive: false,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

