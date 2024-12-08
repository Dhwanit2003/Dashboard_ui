import 'package:dashboard_ui/screens/components/dashboard_contents.dart';
import 'package:flutter/material.dart';
import 'components/sidebar_menu.dart';
import '../utils/responsive.dart';
import 'package:provider/provider.dart';
import '../controllers/controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: isMobile ? const SidebarMenu() : null, // Show drawer only on mobile
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: Row(
                children: [
                  // Sidebar Menu (only visible on desktop)
                  if (Responsive.isDesktop(context))
                    const Expanded(
                      child: SidebarMenu(),
                    ),

                  // Main Dashboard Content
                  const Expanded(
                    flex: 5,
                    child: DashboardContents(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
