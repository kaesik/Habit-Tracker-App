import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GitHub-like Calendar'),
        ),
        body: CalendarWidget(),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final int daysInYear = 365;
  final List<int> activities = List.generate(365, (index) => index % 5);
  final Set<int> selectedDays = {};

  DateTime get startDate =>
      DateTime.now().subtract(Duration(days: daysInYear - 1));

  Color getColor(int activityCount) {
    switch (activityCount) {
      case 0:
        return Colors.green[100]!;
      case 1:
        return Colors.green[300]!;
      case 2:
        return Colors.green[500]!;
      case 3:
        return Colors.green[700]!;
      default:
        return Colors.green[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 14,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: daysInYear,
        itemBuilder: (context, index) {
          DateTime currentDate = startDate.add(Duration(days: index));
          bool isSelected = selectedDays.contains(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedDays.remove(index);
                } else {
                  selectedDays.add(index);
                }
              });
            },
            child: Container(
              width: 50,
              height: 20,
              color:
                  isSelected ? getColor(activities[index]) : Colors.grey[200],
              child: Center(
                child: Text(
                  DateFormat.d().format(currentDate),
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
