import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);

    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Logo Section
          Container(
            height: isDesktop
                ? 100
                : isTablet
                ? 80
                : 50, // Adjust height for screen sizes
            width: isDesktop
                ? 200
                : isTablet
                ? 150
                : 100, // Adjust width for screen sizes
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/banner_image.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 10),
          const Divider(),

          // Header Section
          UserAccountsDrawerHeader(
            accountName: Text(
              "Pooja Mishra",
              style: TextStyle(
                color: Colors.black,
                fontSize: isDesktop ? 12 : isTablet ? 16 : 14,
              ), // Adjust text size for screen sizes
            ),
            accountEmail: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  color: Colors.purpleAccent,
                  width: 2.0,
                ),
              ),
              child: Text(
                "Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isDesktop ? 14 : isTablet ? 12 : 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 30, // Adjust the radius if needed
              backgroundImage: const AssetImage('assets/images/banner_image.png'),
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3), // Blue border
                  borderRadius: BorderRadius.circular(50), // Circular border
                ),
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.transparent, // Makes the border transparent
                width: 0.0, // No visible border
              ),
            ),
          ),

          // Main Menu Items
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.home,
                    title: "Home",
                    isMobile: isMobile,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.group,
                    title: "Employees",
                    isMobile: isMobile,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.checklist,
                    title: "Attendance",
                    isMobile: isMobile,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.calendar_month_outlined,
                    title: "Summary",
                    isMobile: isMobile,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.info_outline,
                    title: "Information",
                    isMobile: isMobile,
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.workspaces_filled,
                        size: isDesktop
                            ? 24
                            : isTablet
                            ? 22
                            : 20),
                    title: Text(
                      "Workspaces",
                      style: TextStyle(
                        fontSize: isDesktop ? 16 : isTablet ? 14 : 12,
                      ),
                    ),
                    children: const [
                      ListTile(
                        title: Text("Adstacks", textAlign: TextAlign.center),
                      ),
                      ListTile(
                        title: Text("Finance", textAlign: TextAlign.center),
                      ),
                    ],
                    childrenPadding: const EdgeInsets.only(left: 20.0),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Menu Items (Settings and Logout)
          const Divider(),
          _buildMenuItem(
            context,
            icon: Icons.settings,
            title: "Settings",
            isMobile: isMobile,
          ),
          _buildMenuItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String title, required bool isMobile}) {
    return ListTile(
      leading: Icon(
        icon,
        size: isMobile ? 20 : 24, // Adjust icon size for mobile
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: isMobile ? 14 : 16, // Adjust text size for mobile
        ),
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
    );
  }
}
