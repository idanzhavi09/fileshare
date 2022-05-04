import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: fileSharePage(),
    ));

class fileSharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 180, 173),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 12, 123),
        title: Center(child: Text("FileShare")),
      ),
      body: share(),
    );
  }
}

class share extends StatefulWidget {
  @override
  _shareState createState() => _shareState();
}

class _shareState extends State<share> {
  var passcode = 'Passcode';
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => {addTime()});
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minuts = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimeCard(time: minuts, header: 'Minuts'),
            const SizedBox(width: 8),
            buildTimeCard(time: seconds, header: 'Seconds'),
          ],
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(passcode),
            TextButton(
              child: Image.asset('images/dropfilehere.png'),
              onPressed: () async {
                final result =
                    await FilePicker.platform.pickFiles(allowMultiple: true);
              },
            ),
          ],
        )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 58, 45, 50)),
            onPressed: () {},
            child: Text('Start Session')),
      ],
    );
  }
}

Widget buildTimeCard({required String time, required String header}) =>
    Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        time,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 72,
        ),
      ),
    );
