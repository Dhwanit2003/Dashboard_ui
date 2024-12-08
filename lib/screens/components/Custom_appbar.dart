import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/responsive.dart';
import 'SearchField.dart';
import '../../controllers/controllers.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.only(
        top: isMobile ? 16.0 : 8.0, // Add extra padding at the top for mobile
        left: isDesktop ? 32.0 : 16.0,
        right: isDesktop ? 32.0 : 16.0,
        bottom: isMobile ? 8.0 : 0.0, // Slight bottom padding for separation
      ),
      color: Colors.grey.shade200, // AppBar background color
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure it doesn't stretch unnecessarily
        children: [
          Row(
            children: [
              // Menu Icon for mobile and tablet
              if (!isDesktop)
                IconButton(
                  onPressed: context.read<Controller>().controlMenu,
                  icon: Icon(Icons.menu, size: isTablet ? 28 : 24),
                ),
              // Title Text
              Expanded(
                flex: isDesktop ? 4 : 2,
                child: Padding(
                  padding: EdgeInsets.all(isDesktop ? 16.0 : 8.0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: isDesktop ? 25 : isTablet ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // SearchField (hidden on mobile)
                Flexible(
                  flex: isDesktop ? 2 : 3,
                  child: SizedBox(
                    child: SearchField(),
                  ),
                ),
               SizedBox(width: 20,),
              // Action Icons
              if(!isMobile)
              Expanded(
                flex: isDesktop ? 1 : 4,
                child: Row(
                  mainAxisAlignment:
                  isDesktop ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_card, color: Colors.grey, size: isTablet ? 28 : 24),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.grey, size: isTablet ? 28 : 24),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.power_settings_new, color: Colors.grey, size: isTablet ? 28 : 24),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Avatar
              CircleAvatar(
                backgroundImage: const AssetImage('assets/images/avatar.png'), // Placeholder avatar image
                radius: isDesktop ? 22 : isTablet ? 20 : 18,
              ),
            ],
          ),
          if (isMobile)
            SizedBox(
              height: 8.0, // Extra spacing at the bottom for better visibility
            ),
        ],
      ),
    );
  }
}
