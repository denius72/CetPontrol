import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/pet.dart';

class PetReminder extends StatelessWidget {

  late Map<String, dynamic> pets;
  PetReminder(Map<String, dynamic> pets)
  {
    this.pets = pets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calendário de eventos")
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
        ),
    );
  }
}
