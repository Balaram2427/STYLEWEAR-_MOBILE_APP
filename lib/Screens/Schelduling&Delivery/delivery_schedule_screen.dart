import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DeliveryScheduleScreen extends StatefulWidget {
  const DeliveryScheduleScreen({super.key});

  @override
  _DeliveryScheduleScreenState createState() => _DeliveryScheduleScreenState();
}

class _DeliveryScheduleScreenState extends State<DeliveryScheduleScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;
  final List<String> _timeSlots = [
    '10:00 AM - 12:00 PM',
    '12:00 PM - 2:00 PM',
    '2:00 PM - 4:00 PM',
    '4:00 PM - 6:00 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDate,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Time Slot',
                border: OutlineInputBorder(),
              ),
              items: _timeSlots.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTimeSlot = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle order confirmation logic here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Order Confirmation'),
                      content: Text(
                          'Your order is scheduled for delivery on ${_selectedDate.toLocal()} at $_selectedTimeSlot.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm Order'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle real-time tracking logic here (optional)
              },
              child: Text('Track Delivery'),
            ),
          ],
        ),
      ),
    );
  }
}
