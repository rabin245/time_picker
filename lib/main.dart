import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepPurple, primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${time.hour}:${time.minute}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  time.format(context),
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                        context: context, initialTime: time);

                    setState(() {
                      time = selectedTime!;
                    });
                  },
                  child: const Text('Time Picker'),
                ),
              ],
            ),
            const SizedBox(width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                // Text(
                //   date.toString(),
                //   style: Theme.of(context).textTheme.headline5,
                // ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2200),
                    );
                    setState(() {
                      date = selectedDate!;
                    });
                  },
                  child: const Text('Date Picker'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
