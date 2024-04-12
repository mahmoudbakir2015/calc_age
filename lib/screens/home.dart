import 'package:calc_age/screens/items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController birthday = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController day = TextEditingController();
  DateTime initilDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: buildText(text: 'Calc Age'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(text: 'Enter your birthday ......'),
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  Expanded(
                    child: buildTextForm(
                      controller: birthday,
                      text: 'Birthday',
                    ),
                  ),
                  Expanded(
                    child: CalendarDatePicker(
                      initialDate: initilDate,
                      firstDate:
                          initilDate.subtract(const Duration(days: 100000)),
                      lastDate: initilDate,
                      onDateChanged: (DateTime value) {
                        setState(() {
                          birthday.text =
                              DateFormat.yMMMMEEEEd().format(value).toString();
                          ageCal(dateTime: value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            buildText(text: 'Your Age Is'),
            buildTextForm(controller: year, text: 'Year'),
            buildTextForm(controller: month, text: 'Month'),
            buildTextForm(controller: day, text: 'Days'),
          ],
        ),
      ),
    );
  }

  ageCal({required DateTime dateTime}) {
    setState(() {
      int totalDays = initilDate.difference(dateTime).inDays;

      year.text = (totalDays ~/ 365).toString();
      month.text = ((totalDays - ((totalDays ~/ 365) * 365)) ~/ 30).toString();

      day.text =
          (totalDays - int.parse(year.text) * 365 - int.parse(month.text) * 30)
              .toString();
    });
  }
}
