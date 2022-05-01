import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: fileSharePage(),
    ));

class fileSharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 233, 213, 100),
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      child: Image.asset('images/dropfilehere.png'),
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
      },
    ));
  }
}
