import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../screens/components/EventCard.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now(); // The day currently being displayed
  DateTime? _selectedDay; // The day the user has selected

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 850,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Background color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // General Information Section
          Text(
            "GENERAL 10:00 AM TO 7:00 PM",
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Flex to divide space equally between Calendar and EventCards
          Expanded(
            child: Flex(
              direction: Axis.vertical,
              children: [
                // Calendar Section
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime(2020),
                          lastDay: DateTime(2030),
                          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              shape: BoxShape.circle,
                            ),
                            cellMargin: EdgeInsets.all(2.0), // Smaller cells
                            defaultTextStyle: TextStyle(fontSize: 12.0), // Smaller day numbers
                            weekendTextStyle: TextStyle(fontSize: 10.0, color: Colors.redAccent),
                            outsideTextStyle: TextStyle(fontSize: 8.0, color: Colors.grey),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(fontSize: 12.0), // Smaller weekdays
                            weekendStyle: TextStyle(fontSize: 10.0, color: Colors.redAccent),
                          ),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(fontSize: 14.0), // Smaller month name
                            headerMargin: EdgeInsets.zero, // Remove top padding
                          ),
                          rowHeight: 30.0, // Reduce row height
                          calendarFormat: CalendarFormat.month,
                          availableGestures: AvailableGestures.none, // Disable scaling
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Birthday Widget
                Expanded(
                  flex: 1,
                  child: EventCard(
                    title: "🎉 Today Birthday 🎉",
                    icon: Icons.cake,
                    total: 2,
                    buttonText: "Birthday Wishing",
                  ),
                ),
                const SizedBox(height: 16),
                // Anniversary Widget
                Expanded(
                  flex: 1,
                  child: EventCard(
                    title: "✨ Anniversary ✨",
                    icon: Icons.favorite,
                    total: 3,
                    buttonText: "Anniversary Wishing",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
