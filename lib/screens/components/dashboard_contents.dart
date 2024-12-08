import 'package:flutter/material.dart';
import 'package:dashboard_ui/widgets/banner_widget.dart';
import 'package:dashboard_ui/widgets/creator_list_widget.dart';
import 'package:dashboard_ui/widgets/project_card_widget.dart';
import 'Custom_appbar.dart';
import '../../widgets/chart_widget.dart';
import '../../widgets/calendar_widget.dart';
import '../../utils/responsive.dart';

class DashboardContents extends StatelessWidget {
  const DashboardContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          // CustomAppbar fixed at the top
          const CustomAppbar(),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Responsive(
                mobile: _buildMobileLayout(context),
                tablet: _buildTabletLayout(context),
                desktop: _buildDesktopLayout(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerWidget(),
        const SizedBox(height: 20),
        ProjectCard(),
        const SizedBox(height: 20),
        CreatorListWidget(),
        const SizedBox(height: 20),
        ChartWidget(),
        const SizedBox(height: 20),
        CalendarScreen(),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerWidget(),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ProjectCard(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CreatorListWidget(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ChartWidget(),
        const SizedBox(height: 20),
        CalendarScreen(),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              BannerWidget(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ProjectCard(), // Takes up 50% of the available space
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CreatorListWidget(), // Takes up the other 50% of the space
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ChartWidget(),
            ],
          ),
        ),
        const SizedBox(width: 20),
        // Sidebar
        const Expanded(
          flex: 1,
          child: CalendarScreen(),
        ),
      ],
    );
  }
}
