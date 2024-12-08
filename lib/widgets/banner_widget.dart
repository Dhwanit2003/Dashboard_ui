import 'package:flutter/material.dart';
import '../utils/responsive.dart'; // Assuming you have the Responsive class in a separate file

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileBanner(),
      tablet: _buildTabletBanner(),
      desktop: _buildDesktopBanner(),
    );
  }

  // Mobile layout
  Widget _buildMobileBanner() {
    return Container(
      width: 500,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFFAB47BC)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/banner_image.png', width: 100),
          SizedBox(height: 10),
          Text("ETHEREUM 2.0", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          Text(
            "Top Rating Project",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            "Trending Project and High Rating",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text("Learn More"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF6C63FF),
            ),
          ),
        ],
      ),
    );
  }

  // Tablet layout
  Widget _buildTabletBanner() {
    return Container(
      width: 900,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFFAB47BC)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ETHEREUM 2.0", style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                Text(
                  "Top Rating Project",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Trending Project and High Rating",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Learn More"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF6C63FF),
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/banner_image.png', width: 150),
        ],
      ),
    );
  }

  // Desktop layout
  Widget _buildDesktopBanner() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFFAB47BC)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ETHEREUM 2.0", style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                Text(
                  "Top Rating Project",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Trending Project and High Rating",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Learn More"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF6C63FF),
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/banner_image.png', width: 250),
        ],
      ),
    );
  }
}
